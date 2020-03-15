#!/usr/bin/env python

import os
import requests

from bottle import route, run, template

@route('/')
def index():
    file_handle = open("/run/secrets/kubernetes.io/serviceaccount/token", "r")
    auth_token = file_handle.read()
    file_handle.close()
    bearer = {'Authorization': 'Bearer ' + auth_token}
    messages = ""

    api_url = 'https://kubernetes/api/v1'
    response = requests.get(api_url, headers=bearer, verify=False)
    messages += "\nApi: " + api_url
    #print(response.headers)
    #print(response.request.headers)
    #print(response.status_code)
    messages += "\nCode: " + str(response.status_code)
    #print(response.json())

    api_url = 'https://kubernetes/api/v1/namespaces/default/pods/'
    response = requests.get(api_url, headers=bearer, verify=False)
    #print(api_url)
    messages += "\nApi: " + api_url
    #print(response.status_code)
    messages += "\nCode: " + str(response.status_code)

    #data = {'app' : 'aaaaa'}
    #response = requests.post(api_url, json=data, headers=bearer)
    return template('Response: {{data}}', data=messages)

run(host='0.0.0.0', port=8080)

