import mysql.connector as con
from colors import Colors
import re

class DatabaseHandler:
    def __init__(self, USERNAME, PASSWORD):
        self.USERNAME = USERNAME
        self.PASSWORD = PASSWORD
        self.max_spacing = 25
        self.option_functions = [self.handle_option1, self.handle_option2, self.handle_option3,
                                 self.handle_option4, self.handle_option5, self.handle_option6, self.handle_option7,
                                 self.handle_option8, self.handle_option9, self.handle_option10, self.handle_option11]
        self.exit_index = len(self.option_functions) + 1

        try:
            self.my_db = con.connect(
                host="localhost",
                user=self.USERNAME,
                passwd=self.PASSWORD,
                database='dna'
            )
            self.cursor = self.my_db.cursor()
            self.connect_status = True

            print(f"Connect status: {Colors.OKGREEN}Connected successfully {Colors.ENDC}")

        except Exception as e:
            self.connect_status = False
            print(f"Connect status: {Colors.FAIL}Failed to connect {Colors.ENDC}")
            print(e)

    def handle_option1(self, args=None):
        QUERY = "select * from owner;"

        self.handler(QUERY)

    def handle_option2(self, args=None):
        QUERY = "select * from food;"

        self.handler(QUERY)

    def handle_option3(self, args=None):
        amount = int(input("Enter amount (-1 to return):"))
        if amount == -1:
            return

        QUERY = f"select * from bill where cost > {amount};"

        self.handler(QUERY)

    def handle_option4(self, args = None):
        QUERY = 'select m.first_name, s.total_salary from pays_salary_manager p, manager m, salary s ' \
                'where p.salary_id=s.id and p.manager_id=m.employee_id order by s.total_salary desc limit 0,1;'

        self.handler(QUERY)

    def handle_option5(self, args = None):
        QUERY = 'select avg(price), cuisine from food group by cuisine;'

        self.handler(QUERY)

    def handle_option6(self, args = None):
        n = int(input("Enter n (-1 to return): "))
        if n == -1:
            return
        QUERY = f'select * from `order` order by amount desc limit {n-1},1;'
        self.handler(QUERY)


    def handle_option7(self, args = None):
        QUERY = 'select m.Employee_id, m.first_name, m.last_name from manager m, waiter w where m.employee_id=w.manager_id ' \
                'group by manager_id having count(w.waiter_id > 2);'

        self.handler(QUERY)

    def handle_option8(self, args= None):
        keyword = str(input(f"{Colors.OKCYAN}Enter keyword: {Colors.ENDC}"))

        query = f'select * from food where food_name like "%{keyword}%";'
        self.handler(query)

    def handle_option9(self, args = None):
        m_id = str(input("Enter Manager_ID: ")).strip()
        f_name = str(input("Enter first_name: ")).strip()
        l_name = str(input("Enter last_name: ")).strip()
        hc_id = str(input("Enter head_chef_id: ")).strip()
        c_id = ''

        manager_pattern = 'MA_[0-9][0-9][0-9]'
        hc_pattern = 'CH_[0-9][0-9][0-9]'

        if bool(re.match(manager_pattern, m_id)) and bool(re.match(hc_pattern, hc_id)):
            try:
                query = 'select chef_id from chef order by chef_id desc limit 1;'
                self.cursor.execute(query)
                max_id = ''
                for d in self.cursor:
                    max_id = d[0]
                c_id = str(max_id[: -1] + str(1 + int(max_id[-1])))
            except Exception as e:
                print(e)

            QUERY = "insert into chef values(%s, %s, %s, %s, %s);"
            values = (c_id, m_id, f_name, l_name, hc_id)
            try:
                self.cursor.execute(QUERY, values)
                self.my_db.commit()
                print(f"{Colors.OKGREEN}Query performed Successful{Colors.ENDC}\n")

            except Exception as e:
                print(f"{Colors.FAIL}{e}{Colors.FAIL}\n")
        else:
            print(f"{Colors.FAIL}Some of the input is/are not valid!{Colors.FAIL}\n")

    def handle_option10(self, args = None):
        c_id = str(input("Input Customer ID: ")).strip()
        customer_pattern = 'CU_[0-9][0-9][0-9]'

        if bool(re.match(customer_pattern, c_id)):
            c_id = "'{}'".format(c_id).strip()
            try:
                QUERY = f"delete from customer where customer_id = {c_id};"
                self.cursor.execute(QUERY)
                self.my_db.commit()
                print(f"{Colors.OKGREEN}Query performed Successful{Colors.ENDC}\n")
            except Exception as e:
                print(f"{Colors.FAIL}{e}{Colors.FAIL}\n")
        else:
            print(f"{Colors.FAIL}Some of the input is/are not valid!{Colors.FAIL}\n")

    def handle_option11(self, args = None):
        food_name = "'{}'".format(str(input("Input food name: "))).strip()
        food_price = "'{}'".format(str(input("Input new food price: "))).strip()

        if int(food_price.split("'")[1]) < 0:
            print(f"{Colors.FAIL}Food price cannot be negative{Colors.FAIL}\n")
            return

        try:
            QUERY = f"update food set price = {food_price} where food_name = {food_name};"
            self.cursor.execute(QUERY)
            self.my_db.commit()
            print(Colors.OKGREEN,"Query performed Successful", Colors.ENDC)
        except Exception as e:
            print(f"{Colors.FAIL}{e}{Colors.ENDC}")

    def execute_options(self, option, args=None):
        if option == self.exit_index:
            exit()
        if option <= 0:
            print("Enter a valid option number")
            return

        if option <= len(self.option_functions):
            self.option_functions[option - 1](args)
        else:
            print("Enter valid option number")


    def handler(self, QUERY):
        try:
            self.cursor.execute(QUERY)
            c = self.cursor.column_names
            multiply = 0
            for col in c:
                multiply += self.max_spacing

            print("-" * (multiply + 1))
            for col in c:
                print(Colors.OKCYAN, col, Colors.ENDC, end= ' ' * (self.max_spacing - len(str(col))))
            print()
            print("-" * (multiply + 1))
            for item in self.cursor:
                for data in item:
                    print(Colors.OKBLUE, str(data), Colors.ENDC, end=' ' * (self.max_spacing - len(str(data))))
                print()
            print("-" * (multiply + 1))
            print(f"{Colors.OKGREEN}Query performed Successful{Colors.ENDC}\n")

        except Exception as e:
            print(Colors.FAIL, e, Colors.ENDC)

