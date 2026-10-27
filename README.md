<div align="center">

# 📞 RingName

**Every Call. Your Name.**

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![SQLite](https://img.shields.io/badge/sqlite-%2307405e.svg?style=for-the-badge&logo=sqlite&logoColor=white)](https://pub.dev/packages/sqflite)

![RingName Banner](https://placehold.co/1000x300/673ab7/ffffff?text=RingName+-+Take+Control+Of+Your+Caller+ID&font=Montserrat)

*Tired of seeing random numbers when your phone rings? With RingName, you can assign custom names to unknown phone numbers. When they call, you see the name you chose!*

</div>

---

## 📸 App Showcase

*(Note: Replace these placeholder images with your actual app screenshots once the UI is complete!)*

<table>
  <tr>
    <td align="center"><b>1. Your Custom Contacts</b></td>
    <td align="center"><b>2. Assign a Name</b></td>
    <td align="center"><b>3. Receive the Call!</b></td>
  </tr>
  <tr>
    <td><img src="https://placehold.co/300x600/f3e5f5/4a148c?text=Home+Screen%0A%0AJohn+Delivery%0ASpammer+1%0AMy+Plumber" alt="Home Screen" width="250"/></td>
    <td><img src="https://placehold.co/300x600/f3e5f5/4a148c?text=Add+Caller%0A%0APhone:+123-456%0AName:+Pizza+Guy" alt="Add Caller Screen" width="250"/></td>
    <td><img src="https://placehold.co/300x600/4a148c/ffffff?text=Incoming+Call...%0A%0APizza+Guy%0A%0A(Accept)/(Decline)" alt="Incoming Call Screen" width="250"/></td>
  </tr>
</table>

---

## ⚙️ How It Works Visually

1. 📝 **Add a Number:** You get a call from a delivery driver. You open RingName and map `+1 555-0198` to **"Pizza Guy"**.
2. 💾 **Secure Storage:** The app saves this securely on your device using a local SQLite database.
3. 📱 **Native Magic:** The next time `+1 555-0198` calls you, RingName intercepts the call using Android native features.
4. 🎉 **Result:** Your screen displays **"Pizza Guy"** instead of the raw number!

---

## ✨ Core Features
- 🏷️ **Custom Caller ID:** Assign custom names to any unknown phone number.
- 🔒 **100% Offline & Private:** All custom mappings are securely stored locally on your device. No cloud uploads.
- 👤 **Default Names:** Configure a default fallback name (e.g., "Unknown Caller") for completely unrecognized numbers.
- 📇 **Easy Management:** Search, add, edit, or delete your custom caller names with a clean, modern UI.
- 🤖 **Deep Android Integration:** Leverages Android's native call screening features to seamlessly detect incoming calls and overlay your mapped names.

---

## 🛠️ Tech Stack
- **Framework:** [Flutter](https://flutter.dev/) (Dart)
- **State Management & Routing:** [GetX](https://pub.dev/packages/get)
- **Architecture:** Feature-based MVVM (Model-View-ViewModel)
- **Local Database:** [sqflite](https://pub.dev/packages/sqflite) & [shared_preferences](https://pub.dev/packages/shared_preferences)
- **Native Android Bridge:** Kotlin Method Channels for Call Screening

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Android Studio / VS Code
- A real Android Device (Native call interception features cannot be fully tested on standard emulators)

### Installation
1. **Clone the repository:**
   ```bash
   git clone https://github.com/rudramadhab22/ringname.git
   ```
2. **Navigate to the directory:**
   ```bash
   cd ringname
   ```
3. **Install dependencies:**
   ```bash
   flutter pub get
   ```
4. **Run the app:**
   ```bash
   flutter run
   ```

---

## 📂 Project Structure
```text
lib/
 ┣ core/              # Theme, Routing, and App-wide Utilities
 ┣ data/              # SQLite DB Setup, Models, and Local Storage Providers
 ┣ features/          # UI Screens (Home, Add Caller, Settings)
 ┃ ┣ home/
 ┃ ┃ ┣ presentation/  # Views and GetX Controllers
 ┃ ┃ ┗ ...
 ┃ ┗ ...
 ┗ main.dart          # Application Entry Point
```

<div align="center">
  <p>Made with ❤️ for a better calling experience.</p>
</div>
