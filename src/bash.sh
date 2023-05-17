#!/bin/bash


UNDONE_FILE="undone_tasks.txt"
DONE_FILE="done_tasks.txt"
DELETED_FILE="deleted_tasks.txt"


touch "$UNDONE_FILE"
touch "$DONE_FILE"
touch "$DELETED_FILE"


add_task() {
    echo "$1" >> "$UNDONE_FILE"
    echo "Task added successfully."
}


display_undone_tasks() {
    if [[ -s "$UNDONE_FILE" ]]; then
        echo "Uncompleted Tasks:"
        cat -n "$UNDONE_FILE"
    else
        echo "No uncompleted tasks."
    fi
}


complete_task() {
    task_number=$1

    if [[ -s "$UNDONE_FILE" ]]; then
        task=$(sed -n "${task_number}p" "$UNDONE_FILE")
        if [[ -n "$task" ]]; then
            echo "$task" >> "$DONE_FILE"
            sed -i "${task_number}d" "$UNDONE_FILE"
            echo "Task marked as completed."
        else
            echo "Invalid task number."
        fi
    else
        echo "No uncompleted tasks."
    fi
}


display_done_tasks() {
    if [[ -s "$DONE_FILE" ]]; then
        echo "Completed Tasks:"
        cat -n "$DONE_FILE"
    else
        echo "No completed tasks."
    fi
}


delete_task() {
    task_number=$1

    if [[ -s "$UNDONE_FILE" ]]; then
        task=$(sed -n "${task_number}p" "$UNDONE_FILE")
        if [[ -n "$task" ]]; then
            echo "$task" >> "$DELETED_FILE"
            sed -i "${task_number}d" "$UNDONE_FILE"
            echo "Task deleted successfully."
        else
            echo "Invalid task number."
        fi
    else
        echo "No uncompleted tasks."
    fi
}


display_deleted_tasks() {
    if [[ -s "$DELETED_FILE" ]]; then
        echo "Deleted Tasks:"
        cat -n "$DELETED_FILE"
    else
        echo "No deleted tasks."
    fi
}


search_tasks() {
    keyword=$1

    echo "Search Results:"
    grep -n "$keyword" "$UNDONE_FILE" "$DONE_FILE" "$DELETED_FILE"
}


while true; do
    echo "ToDo Program"
    echo "1. Add new task"
    echo "2. Display uncompleted tasks"
    echo "3. Mark task as completed"
    echo "4. Display completed tasks"
    echo "5. Delete task"
    echo "6. Display deleted tasks"
    echo "7. Search for a task"
    echo "8. Quit"

    read -rp "Enter your choice (1-8): " choice
    echo

    case $choice in
        1)
            read -rp "Enter the task description: " task_desc
            add_task "$task_desc"
            ;;
        2)
            display_undone_tasks
            ;;
        3)


            # shellcheck disable=SC1073
            # shellcheck disable=SC1073
            # shellcheck disable=SC1073
            # shellcheck disable=SC1073
            read -rp "Enter the task
