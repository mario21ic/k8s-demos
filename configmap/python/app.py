#!/usr/bin/env python

import os

from bottle import route, run, template


@route('/')
def index():
    return template('<b>MY_KEY {{my_value}}</b>!', my_value=os.environ['MY_KEY'])

run(host='0.0.0.0', port=8080)
