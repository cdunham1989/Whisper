# Documentation

In this file we will document our day by day working on this project. Including a description of the decisions we made and why we made them.

## Process

**Monday 4th December**

Today was the first day of our project. We decided to create a TOR-ified mobile messaging app with end-to-end encryption using swift for iOS. We spent a large portion of the day looking into swift. Our main focus was completing 'fizzbuzz' using swift to gain some knowledge on syntax and how testing works. We also used this time to understand how Views work within the context of an iOS application and getting some practice with the Xcode interface.

We also had a lengthy project discussion meeting where we outlined our MVP, the user stories associated with this and also how we wanted to conduct the team whilst working on this project. Details of our decisions can be found within the project Readme file.

We spent time researching a number of important topics for our project:

* What TOR is and what making an app that utilises the system would entail.
* What database system would be best to use for this application.
* The need for a remote server to deal with handling and directing messages to users.

**Tuesday 5th December**

Today we set out to begin working towards our MVP. We decided to split our team to work on:

- Swift app logic: creating users, conversations and researching a database structure for this information to persist in.
- Ruby server logic: Creating a remote server which accepts a string from the application, converts it into JSON format.

**Wednesday 6th December**

Continuing work towards MVP. Team split to work on:

- Implementing Firebase for the Swift app and started work on handling requests to the server using sockets.
- Increasing server functionality to a socket server which handles requests when they are received.

**Thursday 7th December**
- Ruby server logic: Hosted server on Heroku and switched from Eventmachine to Faye websocket for compatibility.
- Set up a websocket using the tutorial: https://www.engineyard.com/blog/getting-started-with-ruby-and-websockets
- Continuing work on app functionality. Finally sorted out users and messages being saved to the server.

**Friday 8th December**
- App functionality breakthrough, finally have messages being saved to the server,recalled from the server and assigned to the relevent users. App now shows like a proper conversation and storyboard for the app is complete. The design may need finishing before the deadline but the barebones functionality is all their.
-

**Monday 11th December**
- Researching and attempting to encrypt user data to ensure passwords are saved in the database as a hash rather than just the password. We struggled to find something which works with Swift 4 effectively. We tried a few systems but found that they did not support Swift 4. Still trying to solve this issue.
- Worked on app sending messages to web socket server, containing user information and outline of who it's being sent to. Messages are also now sent in JSON format and show within the server. Finally, messages can be sent from the server back to the app and show in the relevant conversation.
