# AgriFlow

AgriFlow is a cross-platform irrigation canal monitoring application that helps farmers and field workers check water quality before using a canal. It presents sensor summaries, canal conditions, location-based monitoring, alerts, and recommended actions through a mobile-first Flutter interface.

The current repository contains the application interface and representative monitoring data used to demonstrate the complete user flow.

## Key Features

- Water-quality dashboard with a canal health score
- At-a-glance pH, turbidity, temperature, TDS, and water-level readings
- Detailed metric ranges and safety labels
- Interactive OpenStreetMap canal map built with `flutter_map`
- Color-coded canal states: good, warning, and unsafe
- Water-quality alerts with severity, triggered parameters, and recommendations
- Canal details and recent update information
- Responsive navigation for home, map, alerts, and profile views
- Cross-platform targets for Android, iOS, web, Windows, macOS, and Linux

## Technology Stack

| Area | Technology |
| --- | --- |
| Application framework | Flutter |
| Language | Dart |
| Maps | flutter_map and OpenStreetMap |
| Coordinates | latlong2 |
| Design system | Material Design |
| Testing and linting | flutter_test and flutter_lints |

## Screens and User Flow

```text
Dashboard
├── Canal health score
├── Sensor summaries
├── Recent canal condition
└── Quick actions
    ├── Interactive map
    ├── Sensor history
    ├── Notifications
    └── Report a problem

Map
├── Canal markers
├── Good / warning / unsafe states
└── Selected canal details

Alerts
├── Critical water-quality events
├── Parameter and severity details
└── Recommended actions
```

## Getting Started

### Prerequisites

- Flutter SDK compatible with Dart `^3.10.3`
- Android Studio or Visual Studio Code with Flutter support
- An Android emulator, iOS simulator, desktop target, or web browser

Check your environment:

```bash
flutter doctor
```

### Installation

```bash
git clone https://github.com/barabz/agriflow.git
cd agriflow
flutter pub get
```

### Run the application

```bash
flutter run
```

Choose an available target when prompted. You can also select one directly:

```bash
flutter run -d chrome
flutter run -d windows
```

### Quality checks

```bash
flutter analyze
flutter test
```

### Build examples

```bash
flutter build apk
flutter build web
flutter build windows
```

## Project Structure

```text
lib/
├── controllers/
│   └── app_controller.dart       Navigation state and monitoring data
├── models/
│   ├── alert_item.dart           Alert and severity model
│   ├── map_location.dart         Canal location and status model
│   ├── sensor_summary.dart       Dashboard sensor summary model
│   └── water_quality_metric.dart Detailed metric model
├── views/
│   ├── alerts_view.dart          Water-quality warnings and guidance
│   ├── dashboard_view.dart       Main monitoring dashboard
│   ├── details_view.dart         Detailed canal metrics
│   ├── home_page.dart            Bottom navigation shell
│   ├── map_view.dart             Interactive canal map
│   └── profile_view.dart         User profile view
└── main.dart                     Application entry point and theme
```

## Current Project Status

AgriFlow currently demonstrates the frontend experience using sample data stored in `AppController`. The map uses online OpenStreetMap tiles, so the map view requires an internet connection.

For a live deployment, the next integration step is to replace the sample lists and values with an API, Firebase, Supabase, or another telemetry backend connected to field sensors.

## Suggested Backend Data

A production integration should provide:

- Canal identity, coordinates, and service area
- Timestamped pH, turbidity, temperature, TDS, dissolved oxygen, and water-level readings
- Configurable safe thresholds
- Sensor connectivity and calibration status
- Alert history and acknowledgement state
- Weather and maintenance information

## Future Improvements

- Live ESP32/Arduino sensor telemetry
- User authentication and canal assignments
- Push notifications for unsafe readings
- Historical charts and downloadable reports
- Offline caching for low-connectivity areas
- Location-based weather forecasts
- Administrative web dashboard for canal and sensor management

## Author

Developed by [Gabriel Barbacena](https://github.com/barabz).
