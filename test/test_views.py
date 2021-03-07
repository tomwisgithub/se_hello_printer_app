import unittest
from hello_world import app
from hello_world.formater import SUPPORTED


class FlaskrTestCase(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.app = app.test_client()

    def test_outputs(self):
        rv = self.app.get('/outputs')
        s = str(rv.data)
        ','.join(SUPPORTED) in s

    def test_msg_with_output(self):
        rv = self.app.get('/?output=json')
<<<<<<< HEAD
        self.assertEqual(b'{ "imie":"Tomek W", "mgs":Dzien dobry"}', rv.data)
=======
        self.assertEqual(b' imie:Michal, mgs:Hello World!', rv.data)
>>>>>>> 19b9309fb99bf482c968f50b2311c2a8ddad9f18
