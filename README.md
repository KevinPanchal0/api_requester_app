# API Requester

## Project Overview
The **API Requester** project is a Flutter-based News App that demonstrates efficient API integration using the **http** packages. The app retrieves and displays news articles from an external API while adhering to the Model-View-Controller (MVC) architectural pattern for scalable code organization. This project provides insights into handling state management and error handling for network requests.

---

## Features
- **API Integration**: News articles are fetched from an external API using **http** packages.
- **State Management**: Efficient app state handling using **Provider**.
- **Error Handling**: Graceful handling of network issues and failed API requests with proper user feedback.
- **User Interface**:
    - HomePage and DetailPage implementation.
    - News articles displayed in a user-friendly layout.
    - Filtering of news articles based on categories.
- **Comparison of Packages**: Detailed documentation comparing **http** based on ease of use, features, and performance.

---

## Technologies Used
- **Programming Language**: Dart
- **Framework**: Flutter
- **HTTP Client Packages**:
    - [http](https://pub.dev/packages/http): Lightweight package for simple API requests.
- **State Management**: Provider

---

## Screenshots

<img src="https://github.com/user-attachments/assets/25161432-0a9a-42cd-9edf-1a4d9adfab04" alt="Images" width="300" height="600"> &nbsp;
<img src="https://github.com/user-attachments/assets/9b8bf389-1493-43cf-8c35-2041f58be831" alt="Images" width="300" height="600"> &nbsp;

---

## How It Works
1. **API Integration**: The app connects to an external API to fetch news articles.
    - **http** is used for lightweight requests.
    - **dio** is used for advanced features like interceptors and error handling.
2. **State Management**:
    - Uses Provider or GetX to manage state changes across the app.
3. **UI Implementation**:
    - Displays fetched data on the HomePage.
    - Users can filter news by category and view detailed news on the DetailPage.
4. **Error Handling**:
    - Provides user-friendly messages during network issues or failed API calls.
5. **Comparison of Packages**:
    - Detailed insights into when to use **http** versus **dio** are provided in the documentation.

---

## Project Structure
The project follows the **MVC architecture**:
- **Model**: Manages data and API interaction.
- **View**: Handles UI components.
- **Controller**: Contains business logic and state management.

---

## Documentation Highlights
- Benefits of using MVC for scalable apps.
- Tips for effective state management with Provider.

---

## Acknowledgements
- [Flutter](https://flutter.dev/)
- [Red & White Multimedia Education](https://www.rnwmultimedia.edu.in/)

---
