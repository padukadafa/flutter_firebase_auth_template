# flutter_firebase_auth_template

A flutter project that i made when i bored

## Screenshot


## Feature
1. Login
2. Register
3. Forgot Password
4. Logout

## Setup
1. Goto firebase and create new project
2. After that in project overview click flutter to setup
3. Follow the instruction
4. Clone this repository:
   
   ```
   git clone https://github.com/padukadafa/flutter_firebase_auth_template.git
   ```
5. open project
6. and run pub get
   ```
   flutter pub get
   ```
7. run your virtual device and press F5 to run the project

## App Structure
This app was made using clean architecture and use bloc for the state management
```
lib
  /core
    /error
    /usecases
    /validators
    /values
    /widgets
  /features
    /auth
      /data
        /data_sources
          /remote
        /models
        /repositories
      /domain
        /entities
        /repositories
        /usecases
      /presentation
        /blocs
          /auth
        /pages
          /forgot_password
          /home
          /loading
          /login
            /widgets
          /register
            /widgets
        /widgets
test
  /core
  /features
    /auth
      /data
        /data_sources
          /remote
        /model
        /repositories
      /domain
        /usecases
  /fixtures
```
