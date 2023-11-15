import tkinter as tk
from tkinter import messagebox, PhotoImage
import mysql.connector


class MainMenu:
    def __init__(self, root):
        self.root = root
        self.root.title("Main Menu")

        # Connect to MySQL database (replace these values with your database credentials)
        self.connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root",
            database="contact_manager_db"
        )
        self.cursor = self.connection.cursor()

        # Create buttons
        buttons = [
            ("Add Contact", self.show_add_contact_page),
            ("Remove Contact", self.show_remove_contact_page),
            ("Display Contacts", self.display_contacts),
            ("Search", self.search),
            ("User Settings", self.user_settings),
        ]
        for text, command in buttons:
            button = tk.Button(root, text=text, command=command)
            button.pack(pady=10)

    def execute_query(self, query, data=None):
        try:
            self.cursor.execute(query, data)
            self.connection.commit()
            return True
        except mysql.connector.Error as err:
            messagebox.showerror("Error", f"MySQL Error: {err}")
            return False

    def show_add_contact_page(self):
        # new window for the Add Contact page
        add_contact_window = tk.Toplevel(self.root)
        add_contact_window.title("Add Contact")

        # place widgets for the Add Contact page
        label_first_name = tk.Label(add_contact_window, text="First Name:")
        entry_first_name = tk.Entry(add_contact_window)

        label_last_name = tk.Label(add_contact_window, text="Last Name:")
        entry_last_name = tk.Entry(add_contact_window)

        label_cell_phone = tk.Label(add_contact_window, text="Cell Phone:")
        entry_cell_phone = tk.Entry(add_contact_window)

        label_email = tk.Label(add_contact_window, text="Email:")
        entry_email = tk.Entry(add_contact_window)

        label_contactId = tk.Label(add_contact_window, text="Contact ID:")
        entry_contactId = tk.Entry(add_contact_window)

        btn_add_contact = tk.Button(
            add_contact_window, text="Add Contact", command=lambda: self.add_contact(entry_first_name.get(), entry_last_name.get(), entry_cell_phone.get(), entry_email.get(), add_contact_window))
        btn_back_to_menu = tk.Button(
            add_contact_window, text="Back to Main Menu", command=add_contact_window.destroy)

        label_first_name.grid(row=0, column=0, padx=10, pady=10, sticky=tk.W)
        entry_first_name.grid(row=0, column=1, padx=10, pady=10)

        label_last_name.grid(row=1, column=0, padx=10, pady=10, sticky=tk.W)
        entry_last_name.grid(row=1, column=1, padx=10, pady=10)

        label_cell_phone.grid(row=2, column=0, padx=10, pady=10, sticky=tk.W)
        entry_cell_phone.grid(row=2, column=1, padx=10, pady=10)

        label_contactId.grid(row=3, column=0, padx=10, pady=10, sticky=tk.W)
        entry_contactId.grid(row=3, column=1, padx=10, pady=10)

        label_email.grid(row=3, column=0, padx=10, pady=10, sticky=tk.W)
        entry_email.grid(row=3, column=1, padx=10, pady=10)

        btn_add_contact.grid(row=4, column=1, pady=10)
        btn_back_to_menu.grid(row=5, column=1, pady=10)

    def show_remove_contact_page(self):
        # Create a new window for the Remove Contact page
        remove_contact_window = tk.Toplevel(self.root)
        remove_contact_window.title("Remove Contact")

        # place widgets for the Remove Contact page
        label_id = tk.Label(remove_contact_window, text="Contact ID:")
        entry_id = tk.Entry(remove_contact_window)
        btn_remove_contact = tk.Button(
            remove_contact_window, text="Remove Contact", command=self.remove_contact)
        btn_back_to_menu = tk.Button(
            remove_contact_window, text="Back to Main Menu", command=remove_contact_window.destroy)

        label_id.pack(pady=10)
        entry_id.pack(pady=10)
        btn_remove_contact.pack(pady=10)
        btn_back_to_menu.pack(pady=10)

    def add_contact(self):
        # Get values from the entry widgets
        # Add logic Later
        name = entry_name.get()

        # Validate the input
        if not name:
            messagebox.showwarning("Incomplete Input", "Please enter a name.")
            return

        # Execute the INSERT query to add a new contact
        query = "INSERT INTO contacts (name) VALUES (%s)"
        data = (name,)
        if self.execute_query(query, data):
            messagebox.showinfo(
                "Success", f"Contact '{name}' added successfully.")
            add_contact_window.destroy()  # Close the Add Contact window

    def remove_contact(self):
        # Get values from the entry widgets
        # Add logic Later
        contact_id = entry_id.get()

        # Validate the input
        if not contact_id.isdigit():
            messagebox.showwarning(
                "Invalid Input", "Please enter a valid contact ID.")
            return

        # Execute the DELETE query to remove a contact
        query = "DELETE FROM contacts WHERE id = %s"
        data = (int(contact_id),)
        if self.execute_query(query, data):
            messagebox.showinfo(
                "Success", f"Contact with ID {contact_id} removed successfully.")
            remove_contact_window.destroy()  # Close the Remove Contact window

    def display_contacts(self):
        # Implement the logic for displaying contacts from the database
        messagebox.showinfo(
            "Display Contacts", "Implement the display contacts functionality here.")

    def search(self):
        # Implement the logic for searching contacts in the database
        messagebox.showinfo(
            "Search", "Implement the search functionality here.")

    def user_settings(self):
        # Implement the logic for user settings
        messagebox.showinfo(
            "User Settings", "Implement the user settings functionality here.")


def validate_login(username, password, login_window):
    db_credentials = {
        'host': 'localhost',
        'user': 'root',
        'password': 'root',
        'database': 'contact_manager_db'
    }

    try:
        # Connection to MySQL database
        conn = mysql.connector.connect(**db_credentials)
        cursor = conn.cursor()

        # SELECT query to check if the user exists
        query = "SELECT * FROM user WHERE username = %s AND password = %s"
        cursor.execute(query, (username, password))
        user = cursor.fetchone()

        if user:
            messagebox.showinfo("Login Successful",
                                "Welcome, {}".format(username))
            login_window.destroy()  # get rid of the login window
            main_menu_window = tk.Tk()
            app = MainMenu(main_menu_window)
            main_menu_window.mainloop()
        else:
            messagebox.showerror(
                "Login Failed", "Invalid username or password")

    except mysql.connector.Error as err:
        messagebox.showerror("Error", "MySQL Error: {}".format(err))

    finally:
        # Close the database connection
        if 'conn' in locals() and conn.is_connected():
            cursor.close()
            conn.close()


def login():
    username = entry_username.get()
    password = entry_password.get()

    # validation
    if not username or not password:
        messagebox.showwarning(
            "Incomplete Input", "Please enter both username and password.")
        return

    validate_login(username, password, root)


# main window for login page
root = tk.Tk()
root.title("Login Page")

# Load and display the logo on the login page
login_logo_image = PhotoImage(file="C:/Users/Shane/Databros.png")
login_logo_label = tk.Label(root, image=login_logo_image)
login_logo_label.grid(row=0, column=0, columnspan=2, pady=20)

# Create and place widgets
label_username = tk.Label(root, text="Username:")
label_password = tk.Label(root, text="Password:")
entry_username = tk.Entry(root)
entry_password = tk.Entry(root, show="*")
btn_login = tk.Button(root, text="Login", command=login)

label_username.grid(row=1, column=0, padx=10, pady=10, sticky=tk.W)
label_password.grid(row=2, column=0, padx=10, pady=10, sticky=tk.W)
entry_username.grid(row=1, column=1, padx=10, pady=10)
entry_password.grid(row=2, column=1, padx=10, pady=10)
btn_login.grid(row=3, column=1, pady=10)

# Run the Tkinter event loop
root.mainloop()
