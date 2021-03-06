#!/usr/bin/python3
'''Recurse it! '''
import requests


def recurse(subreddit, hot_list=[]):
    '''queries the Reddit API and prints the titles of the first 10 hot posts
    listed for a given subreddit'''
    url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
    my_header = {'User-Agent': 'my-integration/1.2.3'}
    my_params = {'limit': 25}
    # checks if there is a new page "after" in the ctl_dict
    # in hot_list, the program stores temporary the clt_dict in the last index
    try:
        my_params['after'] = hot_list[-1]['after']
    except:
        pass
    r = requests.get(url, headers=my_header,
                     params=my_params, allow_redirects=False)
    if (r.status_code != 200):
        return None
    r = r.json()
    data = r['data']
    try:  # reads the ctl_dict, wich controls the recursion
        if type(hot_list[-1]) is dict:
            ctl_dict = hot_list[-1].copy()
            del hot_list[-1]  # deleltes de ctl_dict from the list
    except:
        ctl_dict = {'counter': 0, 'after': None}  # creates de ctl_dict
    posts = data['children']
    nb_posts = len(posts)
    counter = ctl_dict['counter']
    if counter < nb_posts:  # append all the posts of the page
        hot_list.append(posts[counter]['data']['title'])
        ctl_dict['counter'] = counter + 1
        hot_list.append(ctl_dict)
        recurse(subreddit, hot_list)
    else:  # to start checking in the new page and free memory
        ctl_dict['counter'] = 0
        ctl_dict['after'] = data.get('after', None)  # stores the next page
        hot_list.append(ctl_dict)
    if ctl_dict['counter'] == 1:  # Checks if we are in the first called func
        if hot_list[-1]['after']:  # Checks if there is a new page
            recurse(subreddit, hot_list)  # The recursion for the next page
        del hot_list[-1]
    return hot_list
