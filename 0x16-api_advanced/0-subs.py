#!/usr/bin/python3
"""Module for retrieving number of subscribers from a subreddit"""
import requests


def number_of_subscribers(subreddit):
    """fetch and return number of subscribers"""
    url = f"https://www.reddit.com/r/{subreddit}/about.json"

    headers = {'User-Agent': 'curl/7.68.0'}

    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 200:
        data = response.json()
        return data['data']['subscribers']
    else:
        return 0
