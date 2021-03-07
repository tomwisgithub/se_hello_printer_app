from hello_world import app
from hello_world.formater import get_formatted
from hello_world.formater import SUPPORTED, PLAIN
from flask import request

moje_imie = "Michal"
msg = "Dzien dobry"



@app.route('/')
def index():
    output = request.args.get('output')
    name = request.args.get('name')
    if not name:
        name = moje_imie
    if not output:
        output = PLAIN
    return get_formatted(msg, name,
                         output.lower())


@app.route('/outputs')
def supported_output():
    return ", ".join(SUPPORTED)
