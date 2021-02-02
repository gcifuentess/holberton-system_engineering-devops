#!/usr/bin/python3
'''Export to JSON several querys'''
import json
import requests


if __name__ == "__main__":
    r1 = requests.get('https://jsonplaceholder.typicode.com/users/')

    employees_dict = {}
    employees = r1.json()
    for employee in employees:
        employee_id = str(employee['id'])
        username = employee['username']
        r2 = requests.get('https://jsonplaceholder.typicode.com/users/' +
                          employee_id + '/todos')
        todos = r2.json()
        todos_list = []
        for todo in todos:
            fields = {}
            fields['task'] = todo['title']
            fields['completed'] = todo['completed']
            fields['username'] = username
            todos_list.append(fields)
            employees_dict[employee_id] = todos_list

    json_str = json.dumps(employees_dict)
    with open("todo_all_employees.json", 'w') as f:
        f.write(json_str)
