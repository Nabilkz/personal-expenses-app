# 💸 Personal Expenses Tracker

A cross-platform Flutter app to manage personal spending with an intuitive interface, weekly charts, and native-style navigation bars for both Android and iOS.

---

## ✨ Features

- 🧾 Add new transactions with title, amount, and date
- 📊 Weekly spending chart with dynamic bar heights
- 🗑️ Delete transactions with a tap
- 🌗 Responsive layout for portrait and landscape
- 🍏 Cupertino + Material design support
- 📱 Platform-adaptive UI using `Platform.isIOS`

---

## 📸 Screenshots

> Add screenshots here if you have them (e.g. `/assets/screenshot1.png`)

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed
- Dart SDK (comes with Flutter)
- Android Studio or Xcode (for emulators)

### Installation

```bash
git clone https://github.com/yourusername/personal_expenses.git
cd personal_expenses
flutter pub get
flutter run
🧠 Project Structure
File/Folder	Purpose
main.dart	App entry point, platform logic, layout
models/transactions.dart	Transaction data model
widgets/chart.dart	Weekly bar chart
widgets/new_transactions.dart	Modal form to add transactions
widgets/transactions_list.dart	List of all transactions
📐 Layout Behavior
Uses MediaQuery to calculate dynamic heights

Landscape mode shows toggle switch for chart/list

Switch.adaptive ensures native feel on both platforms

🛠️ Built With
Flutter 3.32.1

Dart 3.8.1

Cupertino & Material widgets

🤖 Platform-Specific UI
Platform	Navigation	Modal	Icons
Android	AppBar	showModalBottomSheet	Icons.add
iOS	CupertinoNavigationBar	CupertinoButton	CupertinoIcons.add
📬 Contact
Made with ❤️ by Nabil GitHub: @yourusername

📄 License
MIT License. Feel free to fork, modify, and build on top of this project.


---

## 🧭 How to Upload Your Flutter Project to GitHub

Here’s a step-by-step guide to push your local Flutter project to GitHub:

### ✅ 1. Initialize Git in your project folder

```bash
cd your_flutter_project/
git init