# Flutter Navigation App

A simple 3-page navigation app built with Flutter. This app demonstrates the following features:

- **Navigation**: Smooth navigation between three pages (Home, Data, and Contact).
- **API Integration**: Fetches the latest weather data for Ottawa using the OpenWeatherMap API.
- **Responsive Design**: Material 3 and dynamic theming for a modern and adaptive UI.

---

## Features

1. **Home Screen**

   - Displays an image and a text banner styled with Material 3 themes.

2. **Data Screen**

   - Makes an API call to fetch weather data for Ottawa.
   - Displays the most recent weather information, including:
     - Date and time
     - Weather description
     - Temperature in Celsius
   - Uses a `FutureBuilder` to handle data loading.

3. **Contact Screen**
   - Simple form for user contact

---

## Technology Stack

- **Flutter**: Framework for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **Dart**: Programming language used by Flutter.
- **OpenWeatherMap API**: Source for real-time weather data.
- **flutter_dotenv**: For managing environment variables (API keys).
- **Google Fonts**: For enhanced typography.

---

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/hutc0173/flutter-navigation-app.git
   cd flutter_navigation_app
   ```
