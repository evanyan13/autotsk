# AutTsk

![AutoTsk Logo](https://github.com/evanyan13/autotsk/assets/103996156/5193ae65-7044-4399-abc6-773df348abdf)

By: Tay Zhong Kai & Yan Weidong (Evan)

## Table of Content
1. [Poster](#poster)
2. [Deployment](#deployment)
3. [Aim](#aim)
4. [Motivation](#motivation)
5. [User Stories](#user-stories)
6. [End Product Expectation](#end-product-expectation)
7. [Features](#features)
8. [UI Design](#ui-design)

## Poster
<p align="center">
  <img src="https://github.com/evanyan13/autotsk/assets/103996156/2b9c2aec-f135-4066-9e95-c4f8cd7ff3c0" width=50% >
</p>


## Deployment
Use Android device/Android emulator to test out the apk file: [apk files](https://drive.google.com/file/d/1RQye6azhSoNaz5riTA64JtoTnbxyza2L/view?usp=sharing)

Test account email: test@gmail.com
Test account password: 123456

[Demo Video](https://youtu.be/UHSMJo89fGE)


## Aim
> We hope to automate mundane and repetitive daily tasks for users through the use of a productivity app.


## Motivation
Do you ever find yourself wishing for just a few more hours in the day? Imagine what you could accomplish if you had an extra hour at your disposal. In today's fast-paced world, time management is a constant challenge as we strive to balance numerous tasks and responsibilities.

But fear not, because there's a solution that can revolutionize your productivity. Introducing our cutting-edge productivity mobile app powered by artificial intelligence—a personal virtual assistant that's ready to transform the way you manage your time.

Our virtual assistant utilizes the power of AI to handle a wide range of tasks effortlessly. From scheduling appointments to setting reminders and managing deadlines, it takes care of the time-consuming and mundane activities that bog you down.

By entrusting these tedious tasks to your virtual assistant, you gain back precious time to focus on what truly matters. Stay organized, save time, and enhance your overall efficiency with ease. Our app is here to streamline your busy life and 


## User Stories
1. As a student, I want to consistently keep track of a list of tasks through the use of a personal assistant, ensuring I receive timely reminders regarding upcoming assignments and deadlines.
2. As a student, I want to effectively manage my schedules by intelligently organizing my calendar and identifying the most optimal time slots for specific tasks.
3. As a student, I want to streamline my workflow and save valuable time by delegating routine tasks such as scheduling appointments and setting reminders.
empower you to accomplish more than ever before.


## End Product Expectation
**Setup: 
**User authentication with email and password, integrating Google and Apple authentication for login purposes. 
Maintaining user login state and allowing sign-ups of new users.

**Core: **
Home Page, 
Calendar Page, 
Reminder Page,
To-Do List Page,
Profile Page, 
Allowing users to add new tasks to their calendar and having it be reflected in all systems of the app, whether it is in their Calendar or To-Do List. Sorting the tasks by priority so that we can reflect important tasks on the Home Page.

**Extensions: **
Automate new task creation from Canvas.


## Features
### Onboarding Pages
**Description**
AutoTsk provides users with an exceptional experience right from the moment they join our platform. We have carefully crafted a seamless and visually appealing onboarding process that ensures users feel at ease from the very beginning. Through an intuitive sliding page view, users can effortlessly swipe between different pages, each showcasing the unique features and capabilities of our app.

<img src="https://github.com/evanyan13/autotsk/assets/103996156/71a3d40c-22fa-4440-8e08-be43b0c535a9" width=30%>
<img src="https://github.com/evanyan13/autotsk/assets/103996156/4b8a645a-e262-4f90-9e1f-657a67956550" width=30%>
<img src="https://github.com/evanyan13/autotsk/assets/103996156/4fcb0afa-7527-4d01-bd37-01db654be09c" width=30%>

### User Account Authentication
**Description**
We decided to make use of Firebase in-built User authentication with Firebase authentication, providing us with a quick and easy way to implement this feature. User authentication with Firebase allows users to sign in and sign up for our app. Users will also be able to stay logged in with our data state management using Firebase, so there is no need to constantly sign in after creating an account. Firebase simplifies the process of user authentication by doing the heavy lifting for us. Leveraging on Firebase’s comprehensive infrastructure and pre-built SDKs, we were able to implement the user authentication portion of the project. Firebase also allows us to easily obtain users’ information to maintain state and data management, which is useful for solving account-related problems such as creating a subcollection of tasks for each user, where the task stored in the subcollection is specified to the users themselves.

<img src="https://github.com/evanyan13/autotsk/assets/103996156/f0c9fdb8-7817-42da-b018-04bd86cabd04" width=45%>
<img src="https://github.com/evanyan13/autotsk/assets/103996156/9bc502d1-45dd-4e61-9fda-ab8da981070f" width=45%>


### Home Page
**Description**
The Home page of AutoTsk is designed to provide users with an exceptional experience, offering a comprehensive overview of their upcoming tasks and events/meetings. It serves as a central hub, showcasing the latest and most relevant tasks tailored specifically to each user. This intelligently curated container displays essential information, ensuring users stay informed and organized. Through a simple swipe, users can easily navigate through their most important events and tasks 
of the day, gaining a holistic view of their schedule.

<img src="https://github.com/evanyan13/autotsk/assets/103996156/3325afc9-5891-4b16-af48-89f1a7a2b0b3" width=30%>


### Add Task Page
**Add task function**
Users are able to add new tasks that they have by inputting the task name, date, and priority depending on how important it is to them, and also letting them select the category it falls under, adding the location of the task and some notes if needed. The data of this task will be sent to the task folder in our database and relevant information will be displayed on the user’s calendar. Going forward, for things like date and priority, we would want users to only select from a set number of options and therefore will create a dropdown menu to display the options and only allow them to select from those options.

**Date Picker**
The date picker functionality allows users to easily select the dates that they want simply by clicking on the date shown. Even if the date is far out, there are ways to navigate to different months or years, which makes the process a lot faster and easier.

<img src="https://github.com/evanyan13/autotsk/assets/103996156/eefd5a8c-9791-4ece-9054-5c823682e20e" width=30%>


### To Do Page
**Description**
We have come up with a to-do page that gives users an overview of the tasks they have ahead of them. On this page, firstly, from the top, users will be able to see how many tasks they have for the day, and the number there is dynamic, meaning it will change according to how many tasks one has for the day, as recorded in the user’s database. Furthermore, the database of tasks for individual users will be broken down into different categories, and we will list out the number of tasks in each category, that part is still a work in progress.

<img src="https://github.com/evanyan13/autotsk/assets/103996156/54fe74a8-644b-49c8-8518-7ba9453cb89e" width=30%>


### Reminder Page
On this page, users are able to view all their upcoming tasks, regardless of priority. Our algorithm lists out all the tasks that are upcoming in the near future and filters those that have passed out. Besides, we also displayed the tasks on the UI in a ListView format, allowing users to scroll through all the upcoming tasks they have. We also condense the information about the tasks neatly and display them on the UI in an easy-to-read and easy-to-understand format. If users decide they have to view all the information they have inputted into the tasks at the time of creation, they can click on the “click to see the full details” text and a popup with all the information displayed nicely (see photo on right).

### UI Design
[Figma Prototype](https://www.figma.com/file/AfzlIRCCrr6Ah33cxuOsy7/autotsk?type=design&node-id=0%3A1&mode=design&t=6wCSDrTqipNrYfb6-1)











