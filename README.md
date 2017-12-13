# Whisper

## Authors

* Lucy Borthwick
* [Chris Dunham](https://github.com/cdunham1989)
* [Hugo Sykes](https://github.com/hugosykes)
* [Oliver Pople](https://github.com/oliverpople)

## Project Overview

For our final project at Makers Academy we have built a mobile messaging app with end-to-end encryption. As we wanted to build an iOS app, we used Swift and the XCode IDE. We also used Ruby developed our own server with a websocket. This allowed our app to sustain bi-directional communication between app users in real time. This server is hosted remotely on [Heroku](https://www.heroku.com/). 

The github repository for the web socket we built and used can be found [here](https://github.com/hugosykes/Demo-Chat-App).

## Working Methodologies

* Agile
* XP Values
* Daily Stand-ups (10:00) and Retros (17:30)
* Pairing (Aiming to switch driver every 15-20 minutes)
* A separate git branches for each new feature
* Consulting team before merging pull requests
* TDD & BDD. Aiming for 100% test coverage
* Focusing on communication with an open dialogue policy

## Tech Stack

* Swift
* XCTest (App-side Unit and Feature Tests)
* Firebase (database)
* Ruby
* Sinatra
* RSpec
* SimpleCov

## User Stories

**MVP**

```
As a user,
So that I can use Whisper,
I need to create a username

As a user,
So that I can use Whisper,
I need to sign in with my username

As a user,
So that I can start a conversation,
I need to view a list of my current conversations

As a user,
So that I can start a conversation,
I need to be able to send a message to another user

As a user,
So that I can maintain a conversation,
I need to be able to receive a message from another user

As a user,
So I know who I got the message from
I would like to see the username of the user next to the message
```

**Additional Features**

```
As a user,
So that my messages are completely secure,
I want my messages to be encrypted

As a user,
So that I know my password is secure,
I want my password to be encrypted before storing it on the database
```

 **Features We Would Add Given More Time**

```
As a user,
So that my identity is completely secure,
I want my IP address to be encrypted

As a user,
So that the identity of my contacts is completely secure,
I want all metadata to be encrypted

As a user,
So nobody else can read my conversations,
I want my message history to delete when I exit the app

As a user,
So that I am not restricted to only text messages,
I want to be able to send media messages

As a user,
So that I know when my message has been delivered,
I want to see a 'delivered' label under my messages

As a user,
So that I know when my message has been read,
I want to see a 'read' label under my message

As a user,
So I know when I sent a message,
I want to see a timestamp on the message
```

## Running The App Locally

* Clone the repository
```
$ git clone git@github.com:lucyborthwick/Whisper.git
```
* Run the app by opening the project file in Xcode, running pod install and clicking the play button.
```
$ cd ../Whisper
$ open Whisper.xcworkspace
$ pod install
```
* Run our tests by pressing `cmd + u` whilst the project is open in Xcode.
