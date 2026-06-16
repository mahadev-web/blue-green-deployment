from flask import Flask
import socket

app = Flask(__name__)

VERSION = "v1.1"

@app.route('/')
def home():
    hostname = socket.gethostname()

    return f"""
    <html>
    <head>
        <title>Blue-Green Deployment Demo</title>
    </head>

    <body style="
        font-family: Arial, sans-serif;
        text-align: center;
        margin-top: 100px;
        background-color: #f5f5f5;
    ">

        <h1 style="color: #2c3e50;">
            Blue-Green Deployment Demo
        </h1>

        <h2 style="color: green;">
            Version: {VERSION}
        </h2>

        <h3>
            Server: {hostname}
        </h3>

        <p>
            Deployed via Jenkins + Docker + AWS ALB
        </p>

    </body>
    </html>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
