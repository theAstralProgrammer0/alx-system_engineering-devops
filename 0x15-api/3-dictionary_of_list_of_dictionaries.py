#!/usr/bin/python3
"""This module accesses a REST API to fetch employee todo details"""
import json
import requests


def get_emp_todo_progress():
    """This function gets and filters employee details"""
    # Fetch employee details
    users_url = f"https://jsonplaceholder.typicode.com/users"
    users_response = requests.get(users_url)
    if users_response.status_code != 200:
        print(f"Users not found.")
        return
    users = users_response.json()

    all_tasks = {}

    for emp in users:
        emp_id = emp['id']
        # Fetch todos for the employee
        todos_url = f"https://jsonplaceholder.typicode.com/todos?userId={emp_id}"
        todos_response = requests.get(todos_url)
        todos = todos_response.json()

        # Prepare json data
        tasks = [
                    {
                        "username": emp['username'],
                        "task": todo['title'],
                        "completed": todo['completed']
                    }
                    for todo in todos
                ]
                    
        all_tasks[emp_id] = tasks

    # Save json data into json file
    json_file = f"todo_all_employees.json"
    with open(json_file, mode='w', encoding='utf-8', newline='') as f:
        json.dump(all_tasks, f)

    # print(f"Data exported to {emp_id}.json file")


if __name__ == "__main__":
    get_emp_todo_progress()
