# flutter_application (Mini Shopping App)

## Overview
Mini Shopping App is a simple Flutter application that allows users to browse products, add products to favorites, manage their profile, and switch between Light and Dark themes.  
It uses Firebase Authentication for user login/signup and Firestore for storing products.

---

## 📱 Features

- **Authentication**
  - Login and SignUp using email and password
  - User session management

- **Home Screen**
  - Display products from Firestore
  - Search products by name
  - Toggle favorite status for each product

- **Favorites Screen**
  - Display all favorite products
  - Remove products from favorites
  - Clear favorites upon logout

- **Profile Screen**
  - Display user information (Email & UID)
  - Change theme between Light/Dark
  - Logout with clearing favorites

- **Theme Management**
  - Supports light and dark themes
  - Applies to all UI components

---

## 🚀 App Flow

- **SplashScreen:** Shows a welcome message before navigating to Login  
- **Login/SignUp:** Authenticates users using Firebase Auth  
- **Home:** Loads products from Firestore → Search → Add/Remove from favorites  
- **Favorites:** Displays and manages favorite products  
- **Profile:** Shows user info → Theme toggle → Logout

---

## 📂 Folder Structure

```plaintext
lib/
│
├── main.dart
├── my_app.dart
├── firebase_options.dart
│
├── core/
│   ├── widgets/           
│   │   └── app_widgets.dart
│   ├── utiles/           
│   │   ├── app_strings.dart
│   │   └── app_colors.dart
│   ├── theme/             
│   │   └── theme_bloc.dart
│   └── routes/           
│       └── app_routes.dart
│
├── features/
│   ├── splash/
│   │   └── splash_screen.dart
│   │
│   ├── auth/
│   │   ├── bloc/
│   │   │   ├── auth_bloc.dart
│   │   │   ├── auth_event.dart
│   │   │   └── auth_state.dart
│   │   ├── repo/
│   │   │   └── auth_repo.dart
│   │   └── screens/
│   │       ├── login_screen.dart
│   │       └── signup_screen.dart
│   │
│   ├── home/
│   │   ├── bloc/
│   │   │   ├── home_bloc.dart
│   │   │   ├── home_event.dart
│   │   │   └── home_state.dart
│   │   ├── repo/
│   │   │   └── home_repo.dart
│   │   ├── screens/
│   │   │   └── home_screen.dart
│   │   └── model/
│   │       └── product_model.dart
│   │
│   ├── favorites/
│   │   ├── bloc/
│   │   │   ├── fav_bloc.dart
│   │   │   ├── fav_event.dart
│   │   │   └── fav_state.dart
│   │   ├── repo/
│   │   │   └── fav_repo.dart
│   │   └── screens/
│   │       └── favorites_screen.dart
│   │
│   └── profile/
│       ├── bloc/
│       │   ├── profile_bloc.dart
│       │   ├── profile_event.dart
│       │   └── profile_state.dart
│       ├── repo/
│       │   └── profile_repo.dart
│       └── screens/
│           └── profile_screen.dart
```
---

## Screenshots

- **Splash Screen**
<img width="947" height="910" alt="splash" src="https://github.com/user-attachments/assets/e1b24d84-e3c7-496f-acd9-b84593b560ae" />

- **Login Screen**
<img width="950" height="912" alt="login" src="https://github.com/user-attachments/assets/baa3cb59-f5f9-4929-8988-4fb47b579559" />

- **SignUp Screen**
<img width="972" height="912" alt="signup" src="https://github.com/user-attachments/assets/d09fd0b0-8795-46c4-bc28-8216c89f34c7" />

- **Home Screen**
<img width="972" height="911" alt="home" src="https://github.com/user-attachments/assets/51ca3698-23f7-4cde-8027-76563aa604c8" />

- **Favorites Screen**
<img width="972" height="910" alt="favorites" src="https://github.com/user-attachments/assets/1f3d39b6-39c8-4248-9c40-2aad90f5c76e" />

- **Profile Screen**
<img width="970" height="910" alt="profile" src="https://github.com/user-attachments/assets/d451e460-c964-4ac5-89f0-6b2af4e7ebe1" />

- **Searching for a Product**  
<img width="973" height="912" alt="search" src="https://github.com/user-attachments/assets/82c7525e-4936-4b41-9ad7-4fbf163ca6cd" />

- **Theme Changed**
<img width="972" height="911" alt="theme" src="https://github.com/user-attachments/assets/2246ebb9-6c95-4c0e-8a57-07badc1bb7bf" />

---

## 🛠 Tech Stack
- Flutter
- Firebase Authentication
- Cloud Firestore
- Bloc (flutter_bloc)
- Material Design Widgets

---
