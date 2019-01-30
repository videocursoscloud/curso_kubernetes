from flask import Flask
from flask import render_template
import os

app = Flask(__name__)


@app.route('/')
def hello():
    return render_template('test.html')

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)

