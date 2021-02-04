#!/usr/bin/python3
'''Recurse it! '''
import requests


def recurse(subreddit, hot_list=[]):
    '''queries the Reddit API and prints the titles of the first 10 hot posts
    listed for a given subreddit'''
    url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
    my_header = {'User-Agent': 'my-integration/1.2.3'}
    r = requests.get(url, headers=my_header, allow_redirects=False)
    if (r.status_code != 200):
        return None
    r = r.json()
    posts = r['data']['children']
    counter = len(hot_list)
    nb_posts = len(posts)
    if counter < nb_posts:
        hot_list.append(posts[counter]['data']['title'])
        recurse(subreddit, hot_list)
    return hot_list
