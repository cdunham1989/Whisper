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

- Swift app logic: creating users, conversations and a database for this information to persist.
- Ruby server logic: Creating a remote server which accepts a string from the application, converts it into a JSON file and replies with a 'confirmation'.

**Wednesday 6th December**

- Set up a websocket using the tutorial https://www.engineyard.com/blog/getting-started-with-ruby-and-websockets

## Important Documents

[FizzBuzz Swift](https://medium.com/@ynzc/getting-started-with-tdd-in-swift-2fab3e07204b)   
This is the walkthrough we used on day one to give us a starting point for using Swift. It also showed us how to effectively create an app using MVC in Swift.

[Choosing an iOS Database](http://www.elitechsystems.com/which-database-you-should-choose-for-ios-application-development/)   
This is the post we used that pointed us in the direction of using Realm as our database system for the application.

[Libsignal-protocol-c](https://github.com/WhisperSystems/libsignal-protocol-c)

[Signal Protocol](https://www.npmjs.com/package/signal-protocol)

[Virgil-Twilio Demo](https://github.com/VirgilSecurity/virgil-demo-twilio)

[Onion Browser](https://github.com/mtigas/OnionBrowser?files=1)
