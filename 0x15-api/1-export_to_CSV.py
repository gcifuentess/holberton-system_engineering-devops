#!/usr/bin/python3
'''Export to CSV'''
import requests
from sys import argv
import csv


if __name__ == "__main__":
    r1 = requests.get('https://jsonplaceholder.typicode.com/users/' +
                      argv[1])
    r2 = requests.get('https://jsonplaceholder.typicode.com/users/' +
                      argv[1] + '/todos')
    employee_id = str(r1.json()['id'])
    username = r1.json()['username']
    todos = r2.json()
    with open(employee_id + ".csv", 'w', newline='',
              encoding='utf-8') as f:
        writer = csv.writer(f, quoting=csv.QUOTE_ALL)
        for todo in todos:
            fields = []
            fields.append(employee_id)
            fields.append(username)
            fields.append(todo['completed'])
            fields.append(todo['title'])
            writer.writerow(fields)
