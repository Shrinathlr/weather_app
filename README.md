# Weather App

A production-ready Weather Application built with Flutter following Clean Architecture principles.

## Features
- **Clean Architecture**: Separated into Presentation, Domain, and Data layers.
- **State Management**: Uses `flutter_riverpod` for robust state handling.
- **Network Layer**: Uses `dio` for API calls with comprehensive error handling.
- **Offline Support**: Uses `shared_preferences` to cache the last fetched weather data.
- **UI/UX**: Glassmorphic UI with dynamic background gradients based on weather conditions.
- **Dark Mode**: Fully supports system-level Dark Mode.
- **Responsive & Optimized**: Const widgets, minimal rebuilds, and smooth animations.

## Setup Instructions

1. **Clone & Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **API Key Setup**
   - Go to [OpenWeatherMap](https://openweathermap.org/api) and generate an API Free Key.
   - Open the `.env` file located in the root directory.
   - Replace `YOUR_API_KEY_HERE` with your actual OpenWeatherMap API Key.
   ```
   OPENWEATHERMAP_API_KEY=your_actual_api_key
   BASE_URL=https://api.openweathermap.org/data/2.5
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

## Folder Structure
We follow a Feature-First Clean Architecture approach:
```
lib/
 ├─ core/             # Shared utilities, API client, theme, error handling
 ├─ features/
 │   └─ weather/
 │        ├─ data/          # Datasources, Models, Repository Impl
 │        ├─ domain/        # Entities, UseCases, Repository Interfaces
 │        └─ presentation/  # Screens, Widgets, Riverpod State Notifiers
 ├─ main.dart         # Entry point, ProviderScope initialization
```

## Testing
To run the basic unit tests provided:
```bash
flutter test
```

## Example API Response (Current Weather)
```json
{
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 25.0,
    "feels_like": 26.5,
    "temp_min": 24.0,
    "temp_max": 26.0,
    "pressure": 1012,
    "humidity": 60
  },
  "wind": {
    "speed": 4.1,
    "deg": 180
  },
  "name": "London",
  "cod": 200
}
```
