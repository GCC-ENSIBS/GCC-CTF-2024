#!/bin/usr/bin python3

from tqdm import tqdm
import pandas as pd
import xgboost
from xgboost import XGBClassifier
import numpy as np

from pwn import *
import json

   
r = remote("127.0.0.1", 1337)

new_batch = r.recvuntil(b"domains : \n")

i = 0

import tldextract

def domain_extract(domain):
    ext = tldextract.extract(domain)
    if domain.split(".")[-1] == "bazar":
    	return ".".join(domain.split(".")[:-1])
    if (not ext.suffix):
        return np.nan
    else:
        return ext.domain

legit_dataframe = pd.read_csv("dataset_legit.txt", header=0)
legit_dataframe['class'] = 'legit'

legit_dataframe['domain'] = [domain_extract(domain) for domain in legit_dataframe['domain']]

legit_dataframe = legit_dataframe.dropna()
legit_dataframe = legit_dataframe.drop_duplicates()

file_location = "words.txt"

eng_dataframe = pd.read_csv(file_location, header=0, sep=' ');

eng_dataframe = eng_dataframe[eng_dataframe['words'].map(lambda x: str(x).isalpha())]

eng_dataframe = eng_dataframe.applymap(lambda x: str(x).strip().lower())

eng_dataframe = eng_dataframe.dropna()
eng_dataframe = eng_dataframe.drop_duplicates()

from sklearn.feature_extraction.text import TfidfVectorizer

legit_websites_char_vectorizer = TfidfVectorizer(analyzer = 'char', ngram_range=(3,5), min_df=1e-6, max_df=1.0)
legit_websites_counts_matrix = legit_websites_char_vectorizer.fit_transform(legit_dataframe['domain'])
legit_websites_dict_counts = legit_websites_counts_matrix.sum(axis=0).getA1()

eng_word_char_vectorizer = TfidfVectorizer(analyzer = 'char', ngram_range=(3,5), min_df=1e-6, max_df=1.0)
eng_word_counts_matrix = eng_word_char_vectorizer.fit_transform(eng_dataframe['words'])
eng_word_dict_counts = eng_word_counts_matrix.sum(axis=0).getA1()

import math
from collections import Counter

def entropy(s):
    p, lns = Counter(s), float(len(s))
    return -sum( count/lns * math.log(count/lns, 2) for count in p.values())

def dga_detect(domain):
    legit_websites_tfidf_match = legit_websites_dict_counts * legit_websites_char_vectorizer.transform([domain]).T
    
    eng_word_tfidf_match = eng_word_dict_counts * eng_word_char_vectorizer.transform([domain]).T
    
    _X = [len(domain), entropy(domain), legit_websites_tfidf_match, eng_word_tfidf_match]
    
    df = pd.DataFrame([[_X[0], _X[1], _X[2].item(), _X[3].item()]], columns=[['length', 'entropy', 'legit_websites_tfidf', 'eng_word_tfidf']])

    return int(xgb_model.predict(df)[0])

xgb_model = XGBClassifier()
model = xgb_model.load_model('./xgb_model.model')

while b"Here is a new batch" in new_batch:
	domains = json.loads(r.recvuntil(b" }").decode().replace("'", '"'))["domains"]
	print(domains)
	r.recvuntil(b"legit : ")

	preds = []
	for d in domains:
	  #preds.append(dga_detect(domain_extract(d)))
	  preds.append(dga_detect(d))
	  
	message = "{ \"labels\" : " + str(preds) + " }"
	print(i)
	i += 1
	print(message)
	r.sendline(message.encode())
	
	new_batch = r.recvline()
print(new_batch)
