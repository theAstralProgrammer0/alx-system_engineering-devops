#!/usr/bin/python3
"""This module accesses a REST API to fetch employee todo details"""
import csv
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

    # Prepare csv data
    csv_data = [
                    [
                        emp_id,
                        emp['username'],
                        todo['completed'],
                        todo['title']
                    ]
                    for todo in todos
               ]


    # Save csv data into csv file
    csv_file = f"{emp_id}.csv"
    with open(csv_file, mode='w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f, quoting=csv.QUOTE_ALL)
        writer.writerows(csv_data)

    # print(f"Data exported to {emp_id}.csv file")


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
