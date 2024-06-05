#!/usr/bin/python3
"""Module for retrieving number of subscribers from a subreddit"""
import requests


def number_of_subscribers(subreddit):
    """fetch and return number of subscribers"""
    if subreddit is None or not isinstance(subreddit, str):
        return 0

    url = f"https://www.reddit.com/r/{subreddit}/about.json"

    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0;\
Win64;\
 x64) AppleWebKit/537.36 (KHTML, like Gecko) \
 Chrome/125.0.0.0 Safari/537.36'}

    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 200:
        data = response.json()
        return data['data']['subscribers']
    else:
        return 0
