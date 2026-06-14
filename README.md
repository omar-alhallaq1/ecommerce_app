<p align="center">
  <a href="https://flutter.dev" target="_blank">
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/flutter/flutter-original.svg" alt="Flutter" width="90">
  </a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://dart.dev" target="_blank">
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/dart/dart-original.svg" alt="Dart" width="90">
  </a>
</p>
<p align="center">
  <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=flat&logo=Flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-%230175C2.svg?style=flat&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/REST_API-005571?style=flat&logo=json&logoColor=white" alt="REST API">
  <img src="https://img.shields.io/badge/Clean_Architecture-20232A?style=flat" alt="Clean Architecture">
  <img src="https://img.shields.io/badge/License-MIT-green.svg?style=flat" alt="License MIT">
</p>
> This project strictly adheres to Clean Architecture principles and implements robust state management to deliver a scalable, maintainable, and high-performance user experience.

---

## Table of Contents
- [Architecture & Design Patterns](#architecture--design-patterns)
- [Features Implemented](#features-implemented)
- [Tech Stack](#tech-stack)
- [UI/UX Design (Figma)](#uiux-design-figma)
- [Getting Started](#getting-started)

---

## Architecture & Design Patterns

The project is structured following **Clean Architecture**, split into distinct layers to separate concerns and ensure testability:

* **Presentation Layer:** Uses the **BLoC/Cubit** pattern for predictable state management. UI components are modular, reactive, and entirely decoupled from business logic.
* **Domain Layer:** Contains the core business logic, entities, and use cases, acting as the completely independent heart of the application.
* **Data Layer:** Handles data retrieval from ready-made remote APIs using **Dio**, data mapping via robust Models, and repository implementations.
* **Dependency Injection:** Managed elegantly via a centralized **Service Locator** (`GetIt`) to initialize and inject repositories, network clients, and cubits cleanly.

---

## Features Implemented

* **Robust Authentication Workflow:** Completely managed by `AuthCubit`, driving a secure and seamless login/registration state machine across the UI.
* **Dynamic Catalog & Category Management:** Dedicated Cubits handling the asynchronous lifecycle of fetching, caching, and updating product listings and categories seamlessly.
* **Advanced Cart State Handling:** Structured around a reliable `CartModel` designed to efficiently parse, synchronize, and handle basket data interacting with remote endpoints.
* **Premium UI/UX Transitions:** Implements a modern **Shimmer Loading UI** on the main dashboard to elevate perceived performance during asynchronous data fetching.
* **Centralized Asset Management:** Type-safe styling and asset references unified under a declarative design system.

---

## Tech Stack

| Category | Technology / Package |
| :--- | :--- |
| **Frontend Core** | Flutter & Dart |
| **State Management**| Flutter BLoC / Cubit |
| **Networking** | Dio (Interceptors, Error Handling) |
| **Dependency Injection** | GetIt (Service Locator) |
| **Backend Target** | Ready-made RESTful APIs |

---

## UI/UX Design (Figma)

The user interface and user experience components of this application are completely mapped out and designed on Figma. You can explore the full design system, wireframes, and interactive prototypes through the link below:

**[Explore Figma Design Prototype](https://www.figma.com/design/PFnCB775gT6ix25f2pgJEP/Ecommerce-Udemy-Abdallah-Yassein?node-id=0-1&p=f&t=f17JqCraCLV4UNRs-0)**

---

## Getting Started

### Prerequisites
Ensure you have the Flutter SDK installed and configured on your machine.
* Flutter SDK (v3.x or higher recommended)
* Dart SDK

### Installation Steps

1.  **Clone the Repository:**
```bash
    git clone [https://github.com/your-username/ecommerce-app.git](https://github.com/your-username/ecommerce-app.git)
    ```
2.  **Navigate to Project Root:**
```bash
    cd ecommerce-app
    ```
3.  **Fetch Application Dependencies:**
```bash
    flutter pub get
    ```
4.  **Run the Project:**
```bash
    flutter run
    ```

---

## Commit Standard

This project enforces the **Conventional Commits** specification to ensure a clean, meaningful git log graph:
* `feat:` for new features (e.g., `feat: enhance auth workflow`)
* `fix:` for bug fixes (e.g., `fix: resolve login screen build issues`)
* `refactor:` for code changes that neither fix a bug nor add a feature
