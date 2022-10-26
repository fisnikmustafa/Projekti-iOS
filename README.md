# FIEK Portal

This iOS application is part of the Mobile Development course.
 
It was developed using Xcode 12.1 but it is also compatible with older versions down to Xcode 9.3; deployment target is set to iOS 14.1.  
Swift and UIKit were used for development, and Coredata was used as the sole database.

The main goal of this project is to get some practice with iOS development as a beginner, and to get used to components like Buttons, TableViews, etc; hence why it is a simple application. 

## The Idea

The idea behind this app is for professors to be able to log in, check their students attendance points and register any activity (bonus) points for certain students.

## Database

The app uses Coredata and its datamodel consists of three entities: Professor, Student, Bonus. 
Professor entity has a one-to-many relationship with a number of Students.
Student entity has a relationship with a single Professor only and a one-to-many relationship with Bonus entity. 
Bonus entity has a relationship with a single Student only.

**NOTE:**
When the app starts it will create one professor record and some students in the db in order to improvise an account.
You can test the app by logging in with these credentials: (username: john.doe; password: fiek-2022).

## Screens

The application consists of four main screens: Login Screen, Home Screen, Students (attendance) Screen, Bonuses Screen.
Login screen is presented first and after successful authentication the user can navigate through the other screens.


### Login screen

Login screen is the first view that is displayed to the user (after the launch screen). It contains two TextFields for the username and password, and a Button. 
When the Button is pressed, the database will be checked for a record that contains the entered credentials. If a record is found, the user will be presented with the next screen, otherwise the user will be notified that the authentication has failed.

### Home screen

Home screen is a static view not intended for user interaction. It contains an ImageView and some Labels which contain information about the user (Professor) who is logged in - His/her: name, courses, and the number of students enrolled in those courses.


### Students screen

Students screen consists of a TableView with custom row design which is filled with information about student attendance in each of professor's courses and their points in a 'semestral project'.
The user compares the meaning of the first card with the font color of the second card and answers by tapping the "Yes" or "No" button.


### Bonuses screen

The bonus screen contains an interactive TableView with custom row design. This screen allows the professor to add bonus points (1-10) for students.
The "+" plus button on the top right opens an alert with three TextFields so the professor can enter: student name, course name, bonus points. If the student or course entered does not exist, the record will not saved on the database and the user will be notified of this.
The professor can also edit or delete a record by long clicking on the record and selecting the desired action. 
