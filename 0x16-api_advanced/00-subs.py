#!/usr/bin/python3
"""Module for retrieving number of subscribers from a subreddit"""
import requests


def number_of_subscribers(subreddit):
    """fetch and return number of subscribers"""
    if subreddit is None or not isinstance(subreddit, str):
        return 0

    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)

    headers = {'User-Agent': 'Mozilla/10.0/API'}

    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 200:
        data = response.json().get('data')
        return data.get('subscribers')
    else:
        return 0
