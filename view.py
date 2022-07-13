from flask import Flask, jsonify 
import os

app = Flask(__name__)


@app.route('/')
def home():
    resp = { "hello": "world", "built_at": 1627037312, "deployed_at": 1627037348 }
    return jsonify(resp)


if __name__ == "__main__":
    port = int(os.environ.get('PORT', 80))
    app.run(debug=True, host='0.0.0.0', port=port)
