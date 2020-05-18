'''
This file initializes your application and brings together all of the various components.
'''
from flask import Flask
from flask import request


app = Flask(__name__)


@app.route('/')
def index():
    return '<h1>Hello World!</h1>'


@app.route('/nf', methods=['POST'])
def nf():
    print(request.headers.get('link'))


@app.route('/nf')
def nfRender():
    return '<h1>Aqui vai vir o link da NFE via header</h1>'

# @app.route('/nf')
# def nfRender():
#     return '<h1>Aqui vai vir o link da NFE via header</h1>'


if __name__ == "__main__":
    app.debug = True
    app.run(host='0.0.0.0', port=5000)


# Estrutura de fila
# Idendificar sucesso e falha na renderizacao
# Renderizar um html no /nf que solicite e use a camera para ler o qrcode
