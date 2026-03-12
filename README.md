# Notifications App - Flutter Code Test

A simple Flutter app demonstrating a **notifications list** with read/unread functionality, pull-to-refresh, and basic error handling.  
The app uses **BLoC + MVVM architecture** and fetches data from a mock API.

---

## Features

- Fetch notifications from a mock API (https://jsonplaceholder.typicode.com/posts)
- Display notifications in a list with:
  - **Title** (bold)
  - **Content** (truncated if too long)
  - **Date** (small font)
- Unread notifications highlighted with a different background color
- Tap a notification to **mark it as read** and show a **SnackBar**
- Pull-to-refresh to reload the list
- Simple loading indicator while fetching notifications
- Show **empty state** when no notifications are available
- Tap to retry on API failure

---

## Architecture

- **MVVM + BLoC** pattern
- **Model**: Notification data model  
- **View**: UI screens and widgets  
- **BLoC**: Handles state, events, and communication with repository  
- **Repository**: Fetches data from API  

**Folder Structure:**
lib/
├─ models/ # Notification model
├─ services/ # API service
├─ repository/ # Repository layer
├─ bloc/ # BLoC, events, states
├─ widgets/ # Reusable UI widgets
└─ pages/ # Screens (Notifications List)

---

## Getting Started

### Prerequisites

- Flutter SDK >= 3.x ([Installation guide](https://docs.flutter.dev/get-started/install))
- Dart SDK (comes with Flutter)
- Android/iOS emulator or physical device
- IDE (VS Code, Android Studio, IntelliJ)

---

### Running the App

1. Clone the repository:

```bash
git clone https://github.com/MayMyat-Khine/notifications_app.git
cd notifications_app
flutter pub get
flutter run
