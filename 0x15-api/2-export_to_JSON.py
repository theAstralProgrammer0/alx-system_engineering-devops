#!/usr/bin/python3
"""This module accesses a REST API to fetch employee todo details"""
import json
import requests
import sys


def get_emp_todo_progress(emp_id):
    """This function gets and filters employee details"""
    # Fetch employee details
    user_url = f"https://jsonplaceholder.typicode.com/users/{emp_id}"
    user_response = requests.get(user_url)
    if user_response.status_code != 200:
        print(f"employee with ID {emp_id} not found.")
        return
    emp = user_response.json()

    # Fetch todos for the employee
    todos_url = f"https://jsonplaceholder.typicode.com/todos?userId={emp_id}"
    todos_response = requests.get(todos_url)
    todos = todos_response.json()

    # Filter completed tasks
    completed = [todo['title'] for todo in todos if todo['completed']]
    total = len(todos)
    done = len(completed)

    # Prepare json data
    json_data = {
                    emp_id: [
                                {
                                    "task": todo['title'],
                                    "completed": todo['completed'],
                                    "username": emp['username']
                                }
                                for todo in todos
                            ]
                }

    # Save json data into json file
    json_file = f"{emp_id}.json"
    with open(json_file, mode='w', encoding='utf-8', newline='') as f:
        json.dump(json_data, f)

    # print(f"Data exported to {emp_id}.json file")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <emp_id>")
        sys.exit(1)

    try:
        emp_id = int(sys.argv[1])
        get_emp_todo_progress(emp_id)
    except ValueError:
        print("emp ID must be an integer.")
        sys.exit(1)
