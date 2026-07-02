# Python Fundamentals Assessment

## Goal

This assessment checks whether you can use the Python fundamentals we have covered so far.

You will create a small Python project using:

* variables
* comments
* dictionaries
* lists
* keys and values
* different data types
* loops
* simple functions
* parameters and arguments
* imports
* clean code
* nano or vim
* README writing
* GitHub submission

You do not need to use classes.

---

# Rules

You must write your code using **nano** or **vim** only.

You are allowed to use:

* Google
* your own notes
* previous session examples
* Python documentation

You are not allowed to use:

* AI tools to generate the solution
* an IDE
* copied full solutions from the internet

You should run your code from the terminal.

Example:

```bash
python3 main.py
```

---

# Part 1: Project Setup

Create a folder called:

```bash
python_assessment
```

Inside that folder, create these files:

```text
main.py
helpers.py
README.md
```

Your final project should look like this:

```text
python_assessment/
├── main.py
├── helpers.py
└── README.md
```

Use either nano or vim to create and edit your files.

---

# Part 2: Add a Simple Comment

At the top of `main.py`, write one short comment explaining what your program does.

Your comment should explain the purpose of the program.

Avoid comments that only repeat what the code already says.

---

# Part 3: Create One Dictionary

In `main.py`, create one dictionary called:

```python
person
```

The dictionary should describe one person.

It must contain these keys:

```text
name
age
city
is_student
skills
```

Your dictionary must contain different value types:

```text
name         string
age          integer
city         string
is_student   boolean
skills       list
```

Hint: A dictionary uses key and value pairs.

---

# Part 4: Print Specific Values

Print these values from your `person` dictionary:

```text
name
age
city
```

Your output should be easy to read.

Example output style:

```text
Name: Aisha
Age: 24
City: Abu Dhabi
```

Hint: Use the key to access the value.

---

# Part 5: Print All Keys and Values

Print all keys and values from the `person` dictionary using a loop.

Do not manually print each key one by one.

Hint: Dictionaries have a method that lets you loop through keys and values together.

Your output should show both the key and the value.

Example output style:

```text
name: Aisha
age: 24
city: Abu Dhabi
```

---

# Part 6: Create a List of Dictionaries

Now create a list called:

```python
people
```

This list should contain at least 4 dictionaries.

Each dictionary should describe one person.

Each person should have the same keys:

```text
name
age
city
is_student
skills
```

Use your own names and values.

Hint: A list can store multiple dictionaries.

---

# Part 7: Loop Through the List

Loop through the `people` list.

Print each person’s name and city.

Example output style:

```text
Aisha lives in Abu Dhabi.
Omar lives in Dubai.
Sara lives in Sharjah.
```

Hint: You need to loop through the list first, then access values from each dictionary.

---

# Part 8: Work with Lists Inside Dictionaries

Each person has a `skills` list.

For each person, print their skills one by one.

Example output style:

```text
Aisha's skills:
- Python
- Linux
- Git
```

Hint: You will need one loop for the people and another loop for the skills.

---

# Part 9: Work with Booleans

Use an `if` statement to check whether each person is a student.

Example output style:

```text
Aisha is currently a student.
Omar is not currently a student.
```

Hint: The value of `is_student` should be either `True` or `False`.

---

# Part 10: Create a Simple Function

In `helpers.py`, create a function called:

```python
print_person_summary
```

The function should receive one person dictionary.

The function should print a short summary of that person.

Example output style:

```text
Aisha is 24 years old and lives in Abu Dhabi.
```

The function must use data from the dictionary.

Hint: The name inside the function brackets is called a parameter.

---

# Part 11: Import and Use Your Function

Import your function from `helpers.py` into `main.py`.

Use the function inside a loop to print a summary for every person.

Hint: The value you pass into the function when calling it is called an argument.

---

# Part 12: Create a Function That Returns Data

In `helpers.py`, create another function called:

```python
get_students
```

The function should receive the full `people` list.

It should return a new list containing only people where `is_student` is `True`.

In `main.py`, use this function and print the names of the students.

Example output style:

```text
People who are students:
Aisha
Sara
```

Hint: Create an empty list, add matching people to it, then return the list.

---

# Part 13: Create a Function with Two Parameters

In `helpers.py`, create another function called:

```python
get_people_with_skill
```

This function should receive:

```text
people
skill
```

It should return a new list containing only people who have that skill.

In `main.py`, use this function to find people with one chosen skill.

Example output style:

```text
People with Python skill:
Aisha
Omar
```

Hint: Check whether the skill exists inside each person’s skills list.

---

# Part 14: Final Report

In `main.py`, print a final report for all people.

The report should include:

```text
name
age
city
student status
number of skills
```

Example output style:

```text
Final People Report
-------------------

Name: Aisha
Age: 24
City: Abu Dhabi
Student: True
Number of skills: 3
```

Hint: Use `len()` to count the number of skills.

---

# Part 15: README.md

Create a `README.md` file.

Your README should include:

```text
Project title
Short description
What you practiced
How to run the project
List of files
Short question answers
```

Write the README in your own words.

---

# Part 16: Short Questions

Add your answers at the bottom of your `README.md`.

Answer these questions:

1. What is a dictionary?

2. What is a key in a dictionary?

3. What is a value in a dictionary?

4. What is the difference between a list and a dictionary?

5. What is a function?

6. What is a parameter?

7. What is an argument?

8. What does `import` allow us to do?

9. What does this mean?

```python
person["skills"]
```

10. Why is it useful to keep code clean and readable?

---

# Part 17: GitHub Submission

Create a GitHub repository for your assessment.

Push your code to GitHub.

Your repository must include:

```text
main.py
helpers.py
README.md
```

Share the GitHub repository link with the instructor.

Example:

```text
https://github.com/your-username/python-assessment
```

---

# Final Submission Checklist

Before submitting, make sure:

* Your code runs without errors.
* You used nano or vim to create and edit the files.
* You used comments where helpful.
* Your project includes `main.py`.
* Your project includes `helpers.py`.
* Your project includes `README.md`.
* Your `people` list contains at least 4 dictionaries.
* Each dictionary has the required keys.
* Your dictionaries use different data types.
* You printed specific values from a dictionary.
* You printed all keys and values using a loop.
* You used a list of dictionaries.
* You used loops.
* You used simple functions.
* You used parameters and arguments.
* You imported functions from `helpers.py`.
* Your README explains the project.
* Your README includes answers to the short questions.
* Your code is uploaded to GitHub.
* You shared the GitHub repository link.
