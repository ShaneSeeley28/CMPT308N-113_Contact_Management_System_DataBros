import tkinter as tk
from tkinter import messagebox, PhotoImage
import mysql.connector
from hashlib import sha256


class MainMenu:
    main_menu_logo_image = None

    def __init__(self, root):
        self.root = root
        self.root.title("Main Menu")
        self.root.geometry("1920x1080")
        self.root.configure(bg="lightblue")  # Set the background color of the main window
        self.load_main_menu_image()

        # Initialize database connection and cursor
        self.connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root",
            database="contact_manager_db"
        )
        self.cursor = self.connection.cursor()

        button_frame = tk.Frame(self.root, bg="lightblue")  # Set background color of the button frame
        button_frame.pack(pady=20)

        # Create buttons in a horizontal layout
        buttons = [
            ("Add Contact", self.show_add_contact_page),
            ("Remove Contact", self.show_remove_contact_page),
            ("Display Contacts", self.display_contacts),
            ("Search", self.search),
            ("About Us", self.show_about_us_page),  # Added "About Us" button
        ]

        # use frame for the layoutt
        for text, command in buttons:
            button = tk.Button(button_frame, text=text,
                               command=command, font=("Arial", 14, "bold"))
            button.pack(side=tk.LEFT, padx=10, pady=10)


        # Stupid image wont load i swear ive tried everything the except statement doesnt even display an error

    def load_main_menu_image(self):
        try:
            if MainMenu.main_menu_logo_image is None:
                MainMenu.main_menu_logo_image = tk.PhotoImage(
                    file="C:\SoftMARIST\DATA_MANAGEMENT\Databros.png")

            if MainMenu.main_menu_logo_image:
                main_menu_logo_label = tk.Label(
                    self.root, image=MainMenu.main_menu_logo_image)
                main_menu_logo_label.pack()

        except tk.TclError as e:
            print(f"Image loading error: {e}")

    def execute_query(self, query, data=None):
        try:
            self.cursor.execute(query, data)
            self.connection.commit()
            return True
        except mysql.connector.Error as err:
            messagebox.showerror("Error", f"MySQL Error: {err}")
            return False

    def show_add_contact_page(self):
        add_contact_window = tk.Toplevel(self.root)
        add_contact_window.title("Add Contact")
        add_contact_window.geometry("1920x1080")  # Adjust dimensions as needed

        # Center the Add Contact window on the screen
        window_width = add_contact_window.winfo_reqwidth()
        window_height = add_contact_window.winfo_reqheight()
        position_right = int(
            add_contact_window.winfo_screenwidth() / 2 - window_width / 2)
        position_down = int(
            add_contact_window.winfo_screenheight() / 2 - window_height / 2)
        add_contact_window.geometry(
            "+{}+{}".format(position_right, position_down))
        add_contact_window.update_idletasks()

        label_first_name = tk.Label(
            add_contact_window, text="First Name:", font=("Arial", 12))
        entry_first_name = tk.Entry(add_contact_window, font=("Arial", 12))

        label_last_name = tk.Label(
            add_contact_window, text="Last Name:", font=("Arial", 12))
        entry_last_name = tk.Entry(add_contact_window, font=("Arial", 12))

        label_cell_phone = tk.Label(
            add_contact_window, text="Cell Phone:", font=("Arial", 12))
        entry_cell_phone = tk.Entry(add_contact_window, font=("Arial", 12))

        label_work_phone = tk.Label(
            add_contact_window, text="Work Phone:", font=("Arial", 12))
        entry_work_phone = tk.Entry(add_contact_window, font=("Arial", 12))

        label_email = tk.Label(
            add_contact_window, text="Email:", font=("Arial", 12))
        entry_email = tk.Entry(add_contact_window, font=("Arial", 12))

        label_Gender = tk.Label(
            add_contact_window, text="Gender:", font=("Arial", 12))
        entry_Gender = tk.Entry(add_contact_window, font=("Arial", 12))

        label_Birthday = tk.Label(
            add_contact_window, text="Birthday (Y-M-D):", font=("Arial", 12))
        entry_Birthday = tk.Entry(add_contact_window, font=("Arial", 12))

        label_Contact_Id = tk.Label(
            add_contact_window, text="Contact ID:", font=("Arial", 12))
        entry_Contact_Id = tk.Entry(add_contact_window, font=("Arial", 12))

        btn_add_contact = tk.Button(
            add_contact_window, text="Add Contact", command=lambda: self.add_contact(
                entry_first_name.get(), entry_last_name.get(
                ), entry_cell_phone.get(), entry_work_phone.get(),
                entry_email.get(), entry_Gender.get(), entry_Birthday.get(
                ), entry_Contact_Id.get(), add_contact_window
            ), font=("Arial", 12, "bold"), bg="green", fg="white")

        btn_back_to_menu = tk.Button(
            add_contact_window, text="Back to Main Menu", command=add_contact_window.destroy, font=("Arial", 12, "bold"))

        # Grid placements for labels and entry fields
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
        query = "SELECT * FROM display_contacts"
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
        # Create a new window for the search functionality
        search_window = tk.Toplevel(self.root)
        search_window.title("Search Contacts")
        search_window.geometry("500x200")

        # Create and place widgets for the search page
        label_first_name = tk.Label(search_window, text="First Name:")
        entry_first_name = tk.Entry(search_window)

        label_last_name = tk.Label(search_window, text="Last Name:")
        entry_last_name = tk.Entry(search_window)

        btn_search_contact = tk.Button(
            search_window, text="Search Contacts", command=lambda: self.search_contacts(
                entry_first_name.get(), entry_last_name.get(), search_window
            )
        )

        label_first_name.grid(row=0, column=0, padx=10, pady=10, sticky=tk.W)
        entry_first_name.grid(row=0, column=1, padx=10, pady=10)

        label_last_name.grid(row=1, column=0, padx=10, pady=10, sticky=tk.W)
        entry_last_name.grid(row=1, column=1, padx=10, pady=10)

        btn_search_contact.grid(row=2, column=1, pady=10)

    def search_contacts(self, first_name, last_name, search_window):
        # Execute the SELECT query to search contacts
        query = "SELECT * FROM contacts WHERE Fname = %s AND Lname = %s"
        data = (first_name, last_name)
        self.cursor.execute(query, data)
        contacts = self.cursor.fetchall()

        # Create a new window for displaying search results
        search_result_window = tk.Toplevel(search_window)
        search_result_window.title("Search Results")
        search_result_window.geometry("1920x1080")

        # Create a text widget to display search results with a scroll bar
        search_result_text = tk.Text(search_result_window, height=20, width=60)
        search_result_text.pack(padx=20, pady=20, fill=tk.BOTH, expand=True)

        # Scrollbar for search result text
        scrollbar = tk.Scrollbar(search_result_window)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        search_result_text.config(yscrollcommand=scrollbar.set)
        scrollbar.config(command=search_result_text.yview)

        # Format and display the search results
        search_result_text.insert(tk.END, "Search Results:\n\n")
        for contact in contacts:
            search_result_text.insert(tk.END, f"Contact ID: {contact[0]}\n")
            search_result_text.insert(tk.END, f"First Name: {contact[1]}\n")
            search_result_text.insert(tk.END, f"Last Name: {contact[2]}\n")
            search_result_text.insert(tk.END, f"Cell Phone: {contact[3]}\n")
            search_result_text.insert(tk.END, f"Work Phone: {contact[4]}\n")
            search_result_text.insert(tk.END, f"Email: {contact[5]}\n")
            search_result_text.insert(tk.END, f"Gender: {contact[6]}\n")
            search_result_text.insert(tk.END, f"Birthday: {contact[7]}\n")
            search_result_text.insert(tk.END, "------------------------\n")

        # Disable text editing
        search_result_text.config(state=tk.DISABLED)

        # Function to go back to the search window
        def back_to_search():
            search_result_window.destroy()

        # Button to go back to the search window
        btn_back_to_search = tk.Button(
            search_result_window, text="Back to Search", command=back_to_search)
        btn_back_to_search.pack(pady=10)

    def show_about_us_page(self):
        about_us_window = tk.Toplevel(self.root)
        about_us_window.title("About Us")
        about_us_window.geometry("1920x1080")

        about_text = (
            "Welcome to our Contact Management application!\n\n"
            "At DataBros, we are dedicated to providing top-notch contact management services "
            "with a paramount focus on safeguarding your data. Our company specializes in "
            "securing and organizing your contacts efficiently and securely. We understand the "
            "importance of privacy and data security; hence, we utilize cutting-edge encryption "
            "techniques and robust cybersecurity protocols to ensure that your contact information "
            "remains protected at all times.\n\n"
            "Our mission is to offer you a seamless experience in managing your contacts while "
            "ensuring the utmost security and confidentiality of your data. Thank you for choosing "
            "Databros for your contact management needs!"
        )

        about_frame = tk.Frame(about_us_window)
        about_frame.pack(expand=True)

        about_label = tk.Label(
            about_frame,
            text=about_text,
            # Slightly larger font for better readability
            font=("Arial", 14, "bold"),
            justify=tk.CENTER,
            padx=20,
            pady=20,
            wraplength=780,  # Adjusted for the wider window
        )

        about_label.pack(expand=True)

        def back_to_main_menu():
            about_us_window.destroy()

        btn_back_to_menu = tk.Button(
            about_us_window,
            text="Back to Main Menu",
            command=back_to_main_menu,
            font=("Arial", 10, "bold"),
            bg="lightgray",
            padx=10,
            pady=5,
        )
        btn_back_to_menu.pack(side=tk.BOTTOM, pady=10)


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
login_logo_image = tk.PhotoImage(
    file=("C:\SoftMARIST\DATA_MANAGEMENT\Databros.png"))
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