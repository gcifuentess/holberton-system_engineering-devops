#!/usr/bin/python3
'''Top Ten'''
import requests


def top_ten(subreddit):
    '''queries the Reddit API and prints the titles of the first 10 hot posts
    listed for a given subreddit'''
    url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
    my_header = {'User-Agent': 'my-integration/1.2.3'}
    r = requests.get(url, headers=my_header, allow_redirects=False).json()
    # nb_subscribers = r.get('data', {}).get('subscribers', 0)
    r_data = r.get('data', None)
    if (r_data):
        for i in range(10):
            hot_title = r_data['children'][i]['data']['title']
            print(hot_title)
