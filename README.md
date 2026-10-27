# RingName

**Tagline:** Every Call. Your Name.

## 📱 About The App
**RingName** is a Flutter application that allows you to customize how incoming callers are identified by assigning your own names to unknown phone numbers. 

Tired of seeing random numbers? With RingName, you can map unknown numbers to custom names that are stored locally on your device, seamlessly intercepting calls and displaying the name *you* chose.

## ✨ Core Features
- **Custom Caller ID:** Assign custom names to unknown phone numbers.
- **Local Storage:** All custom mappings are securely stored locally on your device using SQLite.
- **Default Names:** Configure a default name for unrecognized callers.
- **Contact Management:** Add, edit, search, and delete your custom caller names.
- **Native Call Interception:** Integrates with Android's calling functionality to detect incoming calls and display your mapped names.

## 🛠️ Tech Stack
- **Framework:** Flutter (Dart)
- **State Management:** GetX
- **Architecture:** Feature-based MVVM
- **Local Database:** SQLite (`sqflite`)
- **Native Integration:** Kotlin (Method Channels for Android call screening)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Android Studio / VS Code
- Android Device or Emulator (Native call features require a real device for full testing)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/rudramadhab22/ringname.git
   ```
2. Navigate to the project directory:
   ```bash
   cd ringname
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## 📂 Project Structure
The project follows a **Feature-based MVVM** architecture:
```text
lib/
 ┣ core/              # App-wide constants, utils, routing, and themes
 ┣ data/              # Data layer (Local DB, Models, Providers)
 ┣ features/          # App features (home, settings, add_caller, etc.)
 ┃ ┣ home/
 ┃ ┃ ┣ presentation/  # UI Views and GetX Controllers
 ┃ ┃ ┗ ...
 ┃ ┗ ...
 ┗ main.dart          # Entry point
```
