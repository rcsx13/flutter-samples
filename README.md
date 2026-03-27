# Flutter Samples

A curated collection of Flutter UI screens and components, built with Material 3 and modern Flutter best practices. Use this project as a reference or starting point for common UI patterns.

## Samples

| Screen | Description |
|--------|-------------|
| **AI Chat** | Chat interface with attachment menu and input bar |

> More screens will be added over time. To add a new sample, create a screen widget and register it in `SamplesHome._samples` inside `lib/main.dart`.

## Project Structure

```
lib/
├── main.dart             # App entry point and samples home screen
├── ai_chat_screen.dart   # AI Chat UI sample
└── utils/
    └── hex_color.dart    # HexColor utility
```

## Requirements

- Flutter `>=3.x`
- Dart SDK `^3.9.2`

## Getting Started

1. **Clone the repository**

   ```bash
   git clone <repo-url>
   cd flutter-samples
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

The home screen lists all available samples. Tap any card to navigate to that screen.

## Dependencies

| Package | Purpose |
|---------|---------|
| [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) | iOS-style icons |
| [`ionicons`](https://pub.dev/packages/ionicons) | Ionicons icon set |

## Platforms

Supports **Android**, **iOS**, **macOS**, and **Web**.
