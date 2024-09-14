# Notes App with Firebase

This is a Flutter application that allows users to create, read, update, and delete notes. The app uses Firebase Firestore as its backend database, enabling real-time synchronization of notes across devices.

## Features

- Create new notes
- View existing notes in a list
- Edit existing notes
- Delete notes
- Real-time updates using Firebase Firestore

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed the latest version of [Flutter](https://flutter.dev/docs/get-started/install)
- You have a Firebase account and have set up a new project
- You have added your Flutter app to your Firebase project and included the necessary configuration files

## Installing Notes App

To install the Notes App, follow these steps:

1. Clone this repository
2. Navigate to the project directory
3. Run `flutter pub get` to install dependencies

## Configuring Firebase

1. Create a new Firebase project in the [Firebase Console](https://console.firebase.google.com/)
2. Add your Flutter app to the Firebase project
3. Enable Firestore in your Firebase project

## Using Notes App

To use Notes App, follow these steps:

1. Run the app on your device or emulator
2. Tap the floating action button to add a new note
3. Tap on the gear and bin icons to either edit or an existing note.

## Code Structure

The main components of the app are:

- `HomePage`: The main screen that displays the list of notes and handles adding/editing notes
- `NotesTile`: A custom widget for displaying individual notes
- `FireStoreService`: A service class that handles all CRUD interactions with Firebase Firestore

Key parts of the code:

- `StreamBuilder`: Used to listen to real-time updates from Firestore
- `addOrEditNoteBox`: A method to handle both adding new notes and editing existing ones
- `FloatingActionButton`: Used to trigger the add note functionality

## Contributing to Notes App

To contribute to Notes App, follow these steps:

1. Fork this repository
2. Create a branch: `git checkout -b <branch_name>`
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin <project_name>/<location>`
5. Create the pull request

## License

This project uses the following license: [MIT License](https://opensource.org/licenses/MIT).
