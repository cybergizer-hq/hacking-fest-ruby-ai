import torch
from flask import Flask, request, jsonify
from transformers import pipeline

app = Flask(__name__)

model_path = "./cache1/model/cardiffnlp/twitter-roberta-base-sentiment-latest"
tokenizer_path = "./cache1/tokenizer/cardiffnlp/twitter-roberta-base-sentiment-latest"

# Load the Hugging Face model
classifier = pipeline("sentiment-analysis", model=model_path, tokenizer=tokenizer_path)

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    text = data.get("text")
    if not text:
        return jsonify({"error": "No text provided"}), 400
    
    result = classifier(text)
    return jsonify(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)