import torch
from transformers import AutoModelForSequenceClassification, AutoTokenizer

# model name
model_name = "cardiffnlp/twitter-roberta-base-sentiment-latest"

# download tokenizer & save
tokenizer = AutoTokenizer.from_pretrained(model_name)
tokenizer.save_pretrained(f"cache1/tokenizer/{model_name}")

# download model & save
model = AutoModelForSequenceClassification.from_pretrained(model_name)
model.save_pretrained(f"cache1/model/{model_name}")