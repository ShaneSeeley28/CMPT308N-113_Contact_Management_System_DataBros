import tkinter as tk
from tkinter import messagebox, PhotoImage
import mysql.connector
from hashlib import sha256


class MainMenu:
    def __init__(self, root):
        self.root = root
        self.root.title("Main Menu")
        self.root.geometry("1920x1080")

        # Stupid image wont load i swear ive tried everything the except statement doesnt even display an error
        try:
            main_menu_logo_image = tk.PhotoImage(
                file=("C:/Users/Shane/Databros.png"))
            main_menu_logo_label = tk.Label(
                self.root, image=main_menu_logo_image)
            main_menu_logo_label.pack()

        except tk.TclError as e:
            print(f"Image loading error: {e}")

        # Connect to MySQL database
        self.connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root",
            database="contact_manager_db"
        )
        self.cursor = self.connection.cursor()

        # Create a frame to contain the buttons and make them horizontal
        button_frame = tk.Frame(self.root)
        button_frame.pack()

        # Create buttons in a horizontal layout
        buttons = [
            ("Add Contact", self.show_add_contact_page),
            ("Remove Contact", self.show_remove_contact_page),
            ("Display Contacts", self.display_contacts),
            ("Search", self.search),
            ("User Settings", self.user_settings),
            ("About Us", self.show_about_us_page),  # Added "About Us" button
        ]

        # use frame for the layoutt
        for text, command in buttons:
            button = tk.Button(button_frame, text=text,
                               command=command, font=("Arial", 14, "bold"))
            button.pack(side=tk.LEFT, padx=10, pady=10)

    def execute_query(self, query, data=None):
        try:
            self.cursor.execute(query, data)
            self.connection.commit()
            return True
        except mysql.connector.Error as err:
            messagebox.showerror("Error", f"MySQL Error: {err}")
            return False

    def show_add_contact_page(self):
        # Create a new window for the Add Contact page
        add_contact_window = tk.Toplevel(self.root)
        add_contact_window.title("Add Contact")
        add_contact_window.geometry("1920x1080")

        # Create and place widgets for the Add Contact page
        label_first_name = tk.Label(add_contact_window, text="First Name:")
        entry_first_name = tk.Entry(add_contact_window)

        label_last_name = tk.Label(add_contact_window, text="Last Name:")
        entry_last_name = tk.Entry(add_contact_window)

        label_cell_phone = tk.Label(add_contact_window, text="Cell Phone:")
        entry_cell_phone = tk.Entry(add_contact_window)

        label_work_phone = tk.Label(add_contact_window, text="Work Phone:")
        entry_work_phone = tk.Entry(add_contact_window)

        label_email = tk.Label(add_contact_window, text="Email:")
        entry_email = tk.Entry(add_contact_window)

        label_Gender = tk.Label(add_contact_window, text="Gender:")
        entry_Gender = tk.Entry(add_contact_window)

        label_Birthday = tk.Label(add_contact_window, text="Birthday (Y-M-D):")
        entry_Birthday = tk.Entry(add_contact_window)

        label_Contact_Id = tk.Label(add_contact_window, text="Contact ID:")
        entry_Contact_Id = tk.Entry(add_contact_window)

        btn_add_contact = tk.Button(
            add_contact_window, text="Add Contact", command=lambda: self.add_contact(
                entry_first_name.get(), entry_last_name.get(
                ), entry_cell_phone.get(), entry_work_phone.get(), entry_email.get(), entry_Gender.get(), entry_Birthday.get(), entry_Contact_Id.get(), add_contact_window
            )
        )
        btn_back_to_menu = tk.Button(
            add_contact_window, text="Back to Main Menu", command=add_contact_window.destroy
        )

        label_first_name.grid(row=0, column=0, padx=10, pady=10, sticky=tk.W)
        entry_first_name.grid(row=0, column=1, padx=10, pady=10)

        label_last_name.grid(row=1, column=0, padx=10, pady=10, sticky=tk.W)
        entry_last_name.grid(row=1, column=1, padx=10, pady=10)

        label_cell_phone.grid(row=2, column=0, padx=10, pady=10, sticky=tk.W)
        entry_cell_phone.grid(row=2, column=1, padx=10, pady=10)

        label_email.grid(row=3, column=0, padx=10, pady=10, sticky=tk.W)
        entry_email.grid(row=3, column=1, padx=10, pady=10)

        label_work_phone.grid(row=4, column=0, padx=10, pady=10, sticky=tk.W)
        entry_work_phone.grid(row=4, column=1, padx=10, pady=10)

        label_Gender.grid(row=5, column=0, padx=10, pady=10, sticky=tk.W)
        entry_Gender.grid(row=5, column=1, padx=10, pady=10)

        label_Birthday.grid(row=6, column=0, padx=10, pady=10, sticky=tk.W)
        entry_Birthday.grid(row=6, column=1, padx=10, pady=10)

        label_Contact_Id.grid(row=7, column=0, padx=10, pady=10, sticky=tk.W)
        entry_Contact_Id.grid(row=7, column=1, padx=10, pady=10)

        btn_add_contact.grid(row=8, column=1, pady=10)
        btn_back_to_menu.grid(row=9, column=1, pady=10)
        btn_back_to_menu.grid(row=9, column=1, pady=10)

    def show_remove_contact_page(self):
        # Create a new window for the Remove Contact page
        remove_contact_window = tk.Toplevel(self.root)
        remove_contact_window.title("Remove Contact")
        remove_contact_window.geometry("1920x1080")

        def remove_selected_contact():
            contact_id = entry_id.get()

            try:
                contact_id = int(contact_id)
                self.remove_contact(contact_id)
            except ValueError:
                messagebox.showerror(
                    "Invalid Input", "Contact ID must be an integer"
                )

            # place widgets for the Remove Contact page
        label_id = tk.Label(remove_contact_window, text="Contact ID:")
        entry_id = tk.Entry(remove_contact_window)
        btn_remove_contact = tk.Button(
            remove_contact_window, text="Remove Current Contact", command=remove_selected_contact)
        btn_back_to_menu = tk.Button(
            remove_contact_window, text="Back to Main Menu", command=remove_contact_window.destroy)

        label_id.pack(pady=10)
        entry_id.pack(pady=10)
        btn_remove_contact.pack(pady=10)
        btn_back_to_menu.pack(pady=10)

    def add_contact(self, first_name, last_name, cell_phone, work_phone, email, gender, birthday, contact_id, add_contact_window):
        # Validate the input
        if not (first_name and last_name and cell_phone and email):
            messagebox.showwarning(
                "Incomplete Input", "Please fill in all fields.")
            return

        # Execute the INSERT query to add a new contact
        query = "INSERT INTO contacts (Fname, Lname, CellPhone, WorkPhone, Email, Gender, Birthday, ContactID) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        data = (first_name, last_name, cell_phone, work_phone,
                email, gender, birthday, contact_id)
        if self.execute_query(query, data):
            messagebox.showinfo("Success", "Contact added successfully.")
            add_contact_window.destroy()  # Close the Add Contact window

    def remove_contact(self, contact_id):
        # Validate the input
        if not contact_id:
            messagebox.showwarning(
                "Incomplete Input", "Please enter a Contact ID.")
            return

        # Execute the DELETE query to remove the contact
        query = "DELETE FROM contacts WHERE ContactID = %s"
        data = (contact_id,)

        if self.execute_query(query, data):
            messagebox.showinfo(
                "Success", f"Contact with ID {contact_id} removed successfully.")
        else:
            messagebox.showerror(
                "Error", f"Failed to remove contact with ID {contact_id}.")

    def display_contacts(self):
        # Fetch all contacts from the database
        query = "SELECT * FROM contacts"
        self.cursor.execute(query)
        contacts = self.cursor.fetchall()

        # Create a new window for displaying contacts
        display_window = tk.Toplevel(self.root)
        display_window.title("Display Contacts")
        display_window.geometry("1920x1080")

        # Create a text widget to display contacts with a scroll bar
        display_text = tk.Text(display_window, height=30, width=100)
        display_text.pack(padx=20, pady=20, fill=tk.BOTH, expand=True)

        # I tried making a scroll bar but it wasnt working
        scrollbar = tk.Scrollbar(display_window)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

        # This still does nothing I tried configuirng it
        display_text.config(yscrollcommand=scrollbar.set)
        scrollbar.config(command=display_text.yview)

        # Format and display the contacts
        display_text.insert(tk.END, "Contact List:\n\n")
        for contact in contacts:
            display_text.insert(tk.END, f"Contact ID: {contact[0]}\n")
            display_text.insert(tk.END, f"First Name: {contact[1]}\n")
            display_text.insert(tk.END, f"Last Name: {contact[2]}\n")
            display_text.insert(tk.END, f"Cell Phone: {contact[3]}\n")
            display_text.insert(tk.END, f"Work Phone: {contact[4]}\n")
            display_text.insert(tk.END, f"Email: {contact[5]}\n")
            display_text.insert(tk.END, f"Gender: {contact[6]}\n")
            display_text.insert(tk.END, f"Birthday: {contact[7]}\n")
            display_text.insert(tk.END, "------------------------\n")

        # Disable text editing
        display_text.config(state=tk.DISABLED)

        # Function to go back to the main menu
        def back_to_main_menu():
            display_window.destroy()

        # Button to go back to the main menu
        btn_back_to_menu = tk.Button(
            display_window, text="Back to Main Menu", command=back_to_main_menu)
        btn_back_to_menu.pack(pady=10)

    def search(self):
        # Implement the logic for searching contacts in the database
        messagebox.showinfo(
            "Search", "Implement the search functionality here.")

    def user_settings(self):
        # Implement the logic for user settings
        messagebox.showinfo(
            "User Settings", "Implement the user settings functionality here.")

    def show_about_us_page(self):
        about_us_window = tk.Toplevel(self.root)
        about_us_window.title("About Us")
        about_us_window.geometry("1920x1080")

        # Add information about your program or team in this window
        about_us_label = tk.Label(about_us_window, text="This is the About Us page.\n"
                                                        "WE ARE DATA BROS: SHANE SEELEY AND JOZEF MASELEK. \n"
                                                        "THANK YOU FOR USING OUR PROGRAM!!!")
        about_us_label.pack(padx=10, pady=10)


def validate_login(username, password, login_window):
    try:
        # Connection to MySQL database
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root",
            database="contact_manager_db")
        cursor = conn.cursor()

        # SELECT query to check if the user exists
        query = "SELECT * FROM user WHERE username = %s"
        cursor.execute(query, (username,))
        user = cursor.fetchone()

        # Assuming the hashed password is stored in the second column
        if user and verify_password(password, user[1]):
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


def verify_password(input_password, hashed_password):
    # Hash the input password and compare it with the stored hashed password
    hashed_input_password = sha256(input_password.encode()).hexdigest()
    return hashed_input_password == hashed_password


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
root.geometry("1920x1080")

# Load and display the logo on the login page
login_logo_image = tk.PhotoImage(file="C:/Users/Shane/Databros.png")
login_logo_label = tk.Label(root, image=login_logo_image)
login_logo_label.pack(pady=20)

# Create and place widgets using pack for consistency
frame = tk.Frame(root)
frame.pack(pady=10)

# Change the font to bold
font_bold = ("Arial", 12, "bold")

label_username = tk.Label(frame, text="Username:", font=font_bold)
label_password = tk.Label(frame, text="Password:", font=font_bold)
entry_username = tk.Entry(frame)
entry_password = tk.Entry(frame, show="*")

# Change the font to bold
btn_font_bold = ("Arial", 12, "bold")
btn_login = tk.Button(root, text="Login", command=login,
                      height=2, width=20, bg="green", font=btn_font_bold)

label_username.pack(padx=10, pady=10, side=tk.LEFT)
entry_username.pack(padx=10, pady=10, side=tk.LEFT)
label_password.pack(padx=10, pady=10, side=tk.LEFT)
entry_password.pack(padx=10, pady=10, side=tk.LEFT)
btn_login.pack(pady=20)  # Adjust pady to control vertical centering

# Run the Tkinter event loop
root.mainloop()
