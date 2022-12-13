from database import DatabaseHandler
from colors import Colors

def main():

    USERNAME = input("Enter Username: ")
    PASSWORD = input("Enter Password: ")

    database = DatabaseHandler(USERNAME, PASSWORD)

    if database.connect_status:
        while True:
            prompt()
            try:
                option = int(input(f"{Colors.HEADER}Enter Choice: {Colors.ENDC}"))
                database.execute_options(option)
            except Exception as e:
                print(f"{Colors.FAIL}{e}{Colors.FAIL}")

def prompt():
    print(f"{Colors.HEADER}Choices: ", Colors.ENDC)
    print("1. Fetch the owner details.")
    print("2. Display menu.")
    print("3. Bills having cost more than certain amount.")
    print("4. Maximum salary of a manager.")
    print("5. Average food price grouped by cuisine.")
    print("6. Order with nth largest amount.")
    print("7. Manager who manages at least 2 employees.")
    print("8. Retrieve names of all food consisting of a given keyword.")
    print("9. Add a new chef.")
    print("10. Remove Customer.")
    print("11. Update price of a food item.")
    print("12. Exit")


if __name__ == '__main__':
    main()
