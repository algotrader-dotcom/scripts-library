# [START app]
import logging
import os

from flask import Flask, render_template, request
import requests

# [START config]
MAILGUN_DOMAIN_NAME = 'thayhuy.net'
MAILGUN_API_KEY = 'key-87ydupeg055ybas7hu5-w8m5fttk8td5'
# [END config]

# [START simple_message]
def send_simple_message(to):
    url = 'https://api.mailgun.net/v3/{}/messages'.format(MAILGUN_DOMAIN_NAME)
    auth = ('api', MAILGUN_API_KEY)
    data = {
        'from': 'Mailgun User <mailgun@{}>'.format(MAILGUN_DOMAIN_NAME),
        'to': to,
        'subject': 'Simple Mailgun Example',
        'text': 'Plaintext content',
    }

    response = requests.post(url, auth=auth, data=data)
    response.raise_for_status()
# [END simple_message]

if __name__ == '__main__':
    send_simple_message('ninhthua82us@gmail.com')
# [END app]
