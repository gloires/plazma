# plazma

Plazma is a Movie and Tv Shows tracker, that can help you to remember all your watched filmes.

## Requirements

- A Mac/Linux/Windows computer.
- [NVM](https://github.com/nvm-sh/nvm).
- [NodeJS](https://nodejs.org/uk/). Install using nvm: ```npm install v10.17.0```. Remember to add ```npm install v10.17.0``` to your preferred shell startup file.
- You may need to install npm globally ```npm install -g npm```
- It is recommended you restart your shell to ensure changes added to startup file are applied.

## Running on iOS simulator
- Checkout the branch you are developing against
- Run ```npm run build```
- Checkout the ```ios-live``` project
- Edit the ```package.json``` file in the root of ```ios-live```, replacing the version of the ```@guardian/abonent dependency``` with the relative path of the local templates repo.

## Running on Android simulator
- Checkout the branch you are developing against
- Run ```npm run build```
- Checkout the ```ios-live``` project
- Edit the ```package.json``` file in the root of ```ios-live```, replacing the version of the ```@guardian/abonent dependency``` with the relative path of the local templates repo.

## Installation Guidelines
Use the flutter run command to run your Flutter app on a connected device or simulator.

To run your app from the command-line:

Open a terminal and change directories to the root of your app (the same directory that contains the ```pubspec.yaml``` file for your project).

Run the following command. Once the flutter tool is running, if you change the app’s source code, you can hit r to hot-reload your application (updating the source on the fly without actually restarting the entire app).

```$ cd myapp``` ```$ flutter run```

If more than one device is connected, use the flutter devices command to get their IDs, and then ```flutter run -d deviceID``` to run your app.


