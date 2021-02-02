#!/usr/bin/python3
'''Export to JSON'''
import json
import requests
from sys import argv


if __name__ == "__main__":
    r1 = requests.get('https://jsonplaceholder.typicode.com/users/' +
                      argv[1])
    r2 = requests.get('https://jsonplaceholder.typicode.com/users/' +
                      argv[1] + '/todos')
    employee_id = str(r1.json()['id'])
    username = r1.json()['username']
    employee_dict = {}
    todos = r2.json()
    todos_list = []
    for todo in todos:
        fields = {}
        fields['task'] = todo['title']
        fields['completed'] = todo['completed']
        fields['username'] = username
        todos_list.append(fields)
    employee_dict[employee_id] = todos_list
    json_str = json.dumps(employee_dict)
    with open(employee_id + ".json", 'w') as f:
        f.write(json_str)
