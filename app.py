import os

from flask import Flask, jsonify, render_template, request
import requests

app = Flask(__name__)

MODEL_SERVICE_URL = os.environ.get("MODEL_SERVICE_HOST", "http://localhost/predict")
EXPOSE_PORT = os.environ.get("EXPOSE_PORT", 80)


@app.route("/", methods=["GET"])
def index():
    return render_template("index.html")


@app.route("/sendreview", methods=["POST"])
def review():
    user_input = request.form["review"]
    payload = {"input": user_input}
    print(payload)
    response = requests.post(f"{MODEL_SERVICE_URL}", json=payload, headers={"accept": "application/json"})
    return jsonify(response.json())


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=EXPOSE_PORT, debug=True)
