from flask import Flask
import os
import socket

app = Flask(__name__)

VERSION = "v1.1"
ENVIRONMENT = os.getenv("ENVIRONMENT", "UNKNOWN")

if ENVIRONMENT == "BLUE":
    bg_color = "#cfe2ff"
    text_color = "#0047ab"
elif ENVIRONMENT == "GREEN":
    bg_color = "#d1e7dd"
    text_color = "#198754"
else:
    bg_color = "#f8f9fa"
    text_color = "#000000"

@app.route('/')
def home():
    return f"""
    <html>
    <head>
        <title>Blue Green Deployment</title>
    </head>
    <body style="
        background-color:{bg_color};
        text-align:center;
        font-family:Arial;
        padding-top:100px;">
        
        <h1>Blue-Green Deployment Demo</h1>

        <h2 style="color:{text_color};">
            Environment: {ENVIRONMENT}
        </h2>

        <h2 style="color:{text_color};">
            Version: {VERSION}
        </h2>

        <h3>
            Server: {socket.gethostname()}
        </h3>

        <p>
            Deployed via Jenkins + Docker + AWS ALB
        </p>
    </body>
    </html>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
