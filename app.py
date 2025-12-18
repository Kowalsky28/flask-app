from flask import Flask, render_template
import socket
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def hello():
    my_hostname = socket.gethostname()
    my_now = datetime.now().strftime("%H:%M:%S")

    return render_template("index.html",hostname = my_hostname, now = my_now)

if __name__ == '__main__':
    app.run(host='0.0.0.0',port = 5000)