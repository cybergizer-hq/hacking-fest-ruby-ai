from flask import Flask, request, jsonify
from transformers import pipeline

app = Flask(__name__)

# Load the Hugging Face model
classifier = pipeline("sentiment-analysis")

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

# from transformers import pipeline

# classifier = pipeline("sentiment-analysis")

# res = classifier("I am bad")

# print(res)