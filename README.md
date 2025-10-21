# 🧵 Swift Concurrency Demo App

A simple iOS demo project that explores three different approaches to running concurrent operations in Swift — Callbacks, Combine, and Swift Concurrency (async/await).
The app concurrently loads multiple images from the network using each paradigm, making it an excellent reference for learning and comparing concurrency models in iOS development.

## 🚀 Overview

This project demonstrates how to:

* **Callback-Based Concurrency** (using completion handlers + DispatchGroup)
* **Combine Framework** (using Future, MergeMany, and collect())
* **Swift Structured Concurrency** (using async/await + TaskGroup)

Each paradigm loads three remote images concurrently, and displays them in a SwiftUI interface.

## Screenshots

<img width="300" alt="Simulator Screenshot - iPhone 16 Pro - 2025-10-21 at 17 48 25" src="https://github.com/user-attachments/assets/57c01245-6d04-418e-9bf1-670f21d2f06b" />
<img width="300" alt="Simulator Screenshot - iPhone 16 Pro - 2025-10-21 at 17 48 28" src="https://github.com/user-attachments/assets/acb4e78a-b4f7-401d-bd63-c4cc088f5a12" />

## 🚀 Features

* Demonstrates three concurrency models side-by-side
* Uses dependency injection via ImageDataSource for testability
* Loads multiple images concurrently using the same URLs
* Built with SwiftUI, Combine, and async/await
* Simple, educational, and easy to extend

## 🛠️ Requirements

* Xcode 15.0+
* Swift 5.9+
* iOS 15.0+

## 🧪 Running the App

Clone the repository

```bash
git clone https://github.com/<your-username>/ConcurrencyImageLoaderDemo.git
cd ConcurrencyImageLoaderDemo
```

Open in Xcode

```bash
cd SwiftConcurrencyDemo
open SwiftConcurrencyDemo.xcodeproj
```

Build and run the project on an iOS simulator or device running iOS 16+.

## 📚 Concepts Demonstrated

| Concept	| Paradigm | Key APIs |
|--|--|--|
| Callbacks	| GCD + DispatchGroup |	`group.enter(), group.leave(), notify()` |
| Combine	| Reactive Streams | `Future, MergeMany, collect()` |
| Swift | Concurrency	Structured Concurrency | `async/await, TaskGroup` |

## 🧩 Future Improvements

* Progressive image loading (update UI as each image finishes)
* Error handling for failed requests
* Unit tests for each loader type
* Add dependency injection for mock data sources

## 👨‍💻 Author

Sylvan .D. Ash
iOS Developer | Swift Enthusiast

🔗 [LinkedIn](https://linkedin.com/in/sylvanash)
💻 [GitHub](https://github.com/sylvan-d-ash)
