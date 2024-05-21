#!/usr/bin/python3
import requests
import sys


def get_emp_todo_progress(emp_id):
    # Fetch employee details
    user_url = f"https://jsonplaceholder.typicode.com/users/{emp_id}"
    user_response = requests.get(user_url)
    if user_response.status_code != 200:
        print(f"employee with ID {emp_id} not found.")
        return

    emp = user_response.json()
    emp_name = emp['name']

    # Fetch todos for the employee
    todos_url = f"https://jsonplaceholder.typicode.com/todos?userId={emp_id}"
    todos_response = requests.get(todos_url)
    todos = todos_response.json()

    # Filter completed tasks
    completed = [todo['title'] for todo in todos if todo['completed']]
    total = len(todos)
    done = len(completed)

    # Print the employee TODO list progress
    print(f"Employee {emp_name} is done with tasks({done}/{total}):")
    for task in completed:
        print(f"\t {task}")


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
