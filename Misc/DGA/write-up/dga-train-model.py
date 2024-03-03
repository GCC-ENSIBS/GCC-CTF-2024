#!/bin/usr/env python3

import pandas as pd
from pandas import DataFrame
import numpy as np
import sklearn

legit_dataframe = pd.read_csv("dataset_legit.txt", header=0)
legit_dataframe['class'] = 'legit'

import tldextract

def domain_extract(domain):
    ext = tldextract.extract(domain)
    if (not ext.suffix):
        return np.nan
    else:
        #print(ext)
        return ext.domain

legit_dataframe['domain'] = [domain_extract(domain) for domain in legit_dataframe['domain']]

legit_dataframe = legit_dataframe.dropna()
legit_dataframe = legit_dataframe.drop_duplicates()

legit_dataframe = legit_dataframe.reindex(np.random.permutation(legit_dataframe.index))
legit_total = legit_dataframe.shape[0]
print('Total Legit domains %d' % legit_total)

dga_dataframe = pd.read_csv("dataset_dga.txt", header=0)
dga_dataframe['class'] = 'dga'

dga_dataframe = dga_dataframe.dropna()
dga_dataframe = dga_dataframe.drop_duplicates()

dga_dataframe = dga_dataframe.reindex(np.random.permutation(dga_dataframe.index))
dga_total = dga_dataframe.shape[0]
print('Total DGA domains %d' % dga_total)

all_domains = pd.concat([legit_dataframe, dga_dataframe], ignore_index=True)

all_domains['length'] = [len(x) for x in all_domains['domain']]

import math
from collections import Counter

def entropy(s):
    p, lns = Counter(s), float(len(s))
    return -sum( count/lns * math.log(count/lns, 2) for count in p.values())

all_domains['entropy'] = [entropy(x) for x in all_domains['domain']]

file_location = "words.txt"

eng_dataframe = pd.read_csv(file_location, header=0, sep=' ');

eng_dataframe = eng_dataframe[eng_dataframe['words'].map(lambda x: str(x).isalpha())]

eng_dataframe = eng_dataframe.applymap(lambda x: str(x).strip().lower())

eng_dataframe = eng_dataframe.dropna()
eng_dataframe = eng_dataframe.drop_duplicates()
eng_dataframe

from sklearn.feature_extraction.text import TfidfVectorizer

legit_websites_char_vectorizer = TfidfVectorizer(analyzer = 'char', ngram_range=(3,5), min_df=1e-6, max_df=1.0)
legit_websites_counts_matrix = legit_websites_char_vectorizer.fit_transform(legit_dataframe['domain'])
legit_websites_dict_counts = legit_websites_counts_matrix.sum(axis=0).getA1()

all_domains['legit_websites_tfidf'] = legit_websites_dict_counts * legit_websites_char_vectorizer.transform(all_domains['domain']).T

eng_word_char_vectorizer = TfidfVectorizer(analyzer = 'char', ngram_range=(3,5), min_df=1e-6, max_df=1.0)
eng_word_counts_matrix = eng_word_char_vectorizer.fit_transform(eng_dataframe['words'])
eng_word_dict_counts = eng_word_counts_matrix.sum(axis=0).getA1()


all_domains['eng_word_tfidf'] = eng_word_dict_counts * eng_word_char_vectorizer.transform(all_domains['domain']).T

def outlier_thresholds(dataframe, col_name, q1=0.20, q3=0.80):
    quartile1 = dataframe[col_name].quantile(q1)
    quartile3 = dataframe[col_name].quantile(q3)
    interquantile_range = quartile3 - quartile1
    up_limit = quartile3 + 1.5 * interquantile_range
    low_limit = quartile1 - 1.5 * interquantile_range
    return low_limit, up_limit


def remove_outlier(dataframe, col_name):
    low_limit, up_limit = outlier_thresholds(dataframe, col_name)
    df_without_outliers = dataframe[~((dataframe[col_name] <= low_limit) | (dataframe[col_name] >= up_limit))]
    return df_without_outliers

all_domains = remove_outlier(all_domains, 'length')
all_domains = remove_outlier(all_domains, 'entropy')
all_domains = remove_outlier(all_domains, 'legit_websites_tfidf')
all_domains = remove_outlier(all_domains, 'eng_word_tfidf')

all_domains.loc[all_domains["class"] == "dga", "class"] = 1
all_domains.loc[all_domains["class"] == "legit", "class"] = 0

X = all_domains[['length', 'entropy', 'legit_websites_tfidf', 'eng_word_tfidf']]
y = np.array(all_domains['class'].tolist())

import xgboost
from xgboost import XGBClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score

xgb_model = XGBClassifier()


X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1)
xgb_model.fit(X_train, y_train)
y_pred = xgb_model.predict(X_test)
xgb_model.score(X_test,y_test)*100

print(confusion_matrix(y_test,y_pred))
print(classification_report(y_test,y_pred))
print(accuracy_score(y_test, y_pred))


xgb_model.save_model('xgb_model.model')
