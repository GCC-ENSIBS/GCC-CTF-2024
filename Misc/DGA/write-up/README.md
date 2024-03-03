# DGA

There is 2 differents ways to detect DGA in real life :
- By using blacklists. But this need to have the knowledge of which algorithm is used. 
- By using machine learning or deep learning.

Here building a ML model is what's exepected.

The 2 files dataset_dga.txt and dataset_legit.txt are here to provide you a dataset to train a model.

There are a lot of examples on the internet that classify DGA and legit domains : 
- https://www.kaggle.com/code/omurcantatar/domain-generation-algorithm-dga-detection/notebook
- https://www.kaggle.com/code/xeric7/dga-detection-using-gru/notebook

Here, I solved the challenge with this implementation : https://www.kaggle.com/code/omurcantatar/domain-generation-algorithm-dga-detection/notebook
It use a TF-IDF Vectorizer based on ngram to vectorize all the domains. Then, the classifier xgboost is used to classify the domains.
The model has a pretty good accuracy with a small dataset (60 000 domains).
