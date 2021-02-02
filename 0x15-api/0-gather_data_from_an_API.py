#!/usr/bin/python3
'''Gather data from an API module'''
import requests
from sys import argv


if __name__ == "__main__":
    r1 = requests.get('https://jsonplaceholder.typicode.com/users/' +
                      argv[1])
    r2 = requests.get('https://jsonplaceholder.typicode.com/users/' +
                      argv[1] + '/todos')
    employee_name = r1.json()['name']
    todos = r2.json()
    count = 0
    done_tasks = []
    for todo in todos:
        if todo['completed'] is True:
            done_tasks.append(count)
        count += 1
    print("Employee " + employee_name + " is done with tasks(" +
          str(len(done_tasks)) + "/" + str(count) + "):")
    for idx in done_tasks:
        print("\t {}".format(todos[idx]['title']))
