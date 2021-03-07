from hello_world import app
from hello_world.formater import get_formatted
from hello_world.formater import SUPPORTED, PLAIN
from flask import request

<<<<<<< HEAD
moje_imie = "Tomek W"
msg = "Dzien dobry"

=======
moje_imie = "Michal"
msg = "Hello World!"
>>>>>>> 19b9309fb99bf482c968f50b2311c2a8ddad9f18


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
