# Student Management System

A Java-based web application for managing student records with CRUD (Create, Read, Update, Delete) functionality.

## Features

- **Student Listing**: View all students in a clean tabular format
- **Add New Students**: Simple form to add new student records
- **Edit Existing Students**: Update student information
- **Delete Students**: Remove student records
- **Responsive Design**: Works on both desktop and mobile devices

## Technologies Used

- **Frontend**: 
  - Bootstrap 5 (for responsive UI)
  - Font Awesome (for icons)
  - JSP (JavaServer Pages)

- **Backend**:
  - Java Servlet
  - MySQL Database

- **Build Tools**:
  - Maven (dependency management)

## Screenshots

### Student Listing Page
![image](https://github.com/user-attachments/assets/ac9fd0b5-1d2f-44be-b44b-510d4947a98d)


### Add/Edit Student Form
![image](https://github.com/user-attachments/assets/072f4245-bbb6-416a-be79-810f8a4b847a)


## Database Schema

```sql
CREATE TABLE student_info (
    std_id INT AUTO_INCREMENT PRIMARY KEY,
    std_name VARCHAR(100) NOT NULL,
    std_class VARCHAR(50) NOT NULL
);
