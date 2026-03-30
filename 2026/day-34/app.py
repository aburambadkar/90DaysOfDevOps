from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    # This will show up in your browser
    return "Hello from the Rebuild!."

if __name__ == "__main__":
    # We use 0.0.0.0 so it listens to traffic from outside the container
    app.run(host="0.0.0.0", port=5000)
