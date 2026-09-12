# AGENTS.md — Frontend Repository Guidelines & Architecture Manual

> **Repository**: `ammingo-frontend`  
> **Tech Stack**: Flutter 3.11+ | Dart SDK 3.11+ | Provider | Dio | Flutter Secure Storage | Material Design 3  
> **Target Platform**: Android (Primary Mobile Target) / Web / iOS  
> **Target Audience**: AI Agents (Antigravity, Gemini CLI, Cursor, Codex) & Core Developers  

---

## 1. Executive Overview & System Purpose

`ammingo-frontend` is the client mobile and web application for **amMingo**, an open-source social human bingo platform. The app provides a reactive, interactive user interface for:
- User onboarding via Email OTP verification and Google sign-in.
- Role selection (Event Host vs. Participant).
- Creating bingo events with custom descriptions, participant limits, and duration.
- Joining events using 6-digit codes or built-in QR code camera scanning.
- Live bingo board interaction, tile completion submission with proof photos/facts, live game status monitoring, and real-time leaderboards.

---

## 2. Agent Behavioral Guidelines & Operational Directives

When modifying, extending, or debugging `ammingo-frontend`, all AI agents **MUST** follow these mandatory guidelines:

1. **Static Analysis & Lint Verification**:
   - Always run `flutter analyze` after modifying Dart files to ensure code quality and avoid unused variables, missing imports, or type errors.
   - Run unit/widget tests with `flutter test`.

2. **Code Generation Compliance**:
   - If modifying models or files using `@JsonSerializable()`, run `dart run build_runner build --delete-conflicting-outputs` to update generated `.g.dart` files.

3. **State Management & UI Principles**:
   - Use `Provider` (`provider` package) for application-wide reactive state management (e.g. [lib/providers/theme_provider.dart](file:///home/kota-jagadeeshwar-reddy/ammingo/ammingo-frontend/lib/providers/theme_provider.dart)).
   - Prefer `StatelessWidget` when state is strictly external or static. Use `StatefulWidget` only for local widget lifecycle management (e.g., text controllers, tab state).

4. **Network & Error Handling Integrity**:
   - All backend API interactions must pass through [lib/services/auth_service.dart](file:///home/kota-jagadeeshwar-reddy/ammingo/ammingo-frontend/lib/services/auth_service.dart) or dedicated service classes using `Dio`.
   - Always catch `DioException` and present user-friendly error messages (e.g., via `ScaffoldMessenger.of(context).showSnackBar(...)`).
   - Secure tokens (JWT) must be stored and retrieved exclusively using `FlutterSecureStorage`.

---

## 3. Repository Layout & Directory Structure

```
ammingo-frontend/
├── assets/                    # Static image assets & branding icons
│   └── images/                # amMingo logos, default avatars, background illustrations
├── lib/                       # Main Dart source code
│   ├── main.dart              # Application entry point, Provider setup & route generator
│   ├── providers/             # Global app state & theme providers
│   │   └── theme_provider.dart# App light/dark theme state management
│   ├── screens/               # Screen UI widgets & view controllers
│   │   ├── login_screen.dart          # OTP Email & Google auth screen
│   │   ├── role_selection.dart        # Host vs Guest selection
│   │   ├── enter_username.dart        # User profile setup
│   │   ├── create_event.dart          # Event creation form
│   │   ├── join_event.dart            # Join code & QR scanner view
│   │   ├── event_details.dart         # Pre-game lobby & details
│   │   ├── bingo_board.dart           # Interactive Bingo grid view
│   │   ├── bingo_tile.dart            # Individual tile detail view
│   │   ├── friend_verification.dart   # Tile completion proof submission
│   │   ├── game_monitor.dart          # Host live game monitoring screen
│   │   ├── leaderboard_screen.dart    # Live score standings
│   │   ├── profile_screen.dart        # User profile & statistics
│   │   └── preview_screen.dart        # Preview & camera test screen
│   ├── services/              # API networking & HTTP client layer
│   │   └── auth_service.dart  # Dio HTTP client, JWT storage & backend API calls
│   ├── styles/                # UI styling, color themes & typography
│   └── widgets/               # Reusable atomic UI components
├── test/                      # Flutter unit and widget test suite
│   └── widget_test.dart       # Default widget test file
├── analysis_options.yaml      # Static analysis & linter rule definitions (`flutter_lints`)
├── android/                   # Native Android host platform project
├── ios/                       # Native iOS host platform project
├── web/                       # Web host platform project
└── pubspec.yaml               # Package dependencies & asset configuration
```

---

## 4. Development Environment & Setup

### Prerequisites
- Flutter SDK 3.11.0 or newer
- Dart SDK 3.11.0 or newer
- Android Studio / VS Code with Flutter extension
- Android Emulator or physical device (or Chrome for web testing)

### Local Setup Steps
```bash
# 1. Clone & enter repository
cd ammingo-frontend

# 2. Fetch dependencies
flutter pub get

# 3. Verify static analysis
flutter analyze

# 4. Run application on connected device / emulator
flutter run -d android
```

---

## 5. Key Operational Commands

| Action | Command |
| :--- | :--- |
| **Run App on Android** | `flutter run -d android` |
| **Run App on Chrome (Web)** | `flutter run -d chrome` |
| **List Connected Devices** | `flutter devices` |
| **Static Code Analysis** | `flutter analyze` |
| **Execute Unit/Widget Tests** | `flutter test` |
| **Run Code Generator** | `dart run build_runner build --delete-conflicting-outputs` |
| **Build Android APK** | `flutter build apk --release` |

---

## 6. Networking & API Configuration

Backend service integration is configured in [lib/services/auth_service.dart](file:///home/kota-jagadeeshwar-reddy/ammingo/ammingo-frontend/lib/services/auth_service.dart).

### Backend Base URL Setup
- Default Production API URL: `https://amingoapi.amfoss.in/api`
- Local Development Base URL: `http://10.0.2.2:8000/api` (Android Emulator loopback) or `http://localhost:8000/api` (Web / Desktop).

### Auth Headers
Dio requests automatically append stored JWT tokens via interceptor or options:
```dart
Options(headers: {'Authorization': 'Bearer $token'});
```

---

## 7. Architectural Conventions & UI Rules

### 7.1 Styling & Theme Consistency
- All visual elements should respect Material 3 design directives.
- Use primary colors from theme tokens (`Theme.of(context).colorScheme.primary`). Avoid inline hardcoded color values.
- Support both Light and Dark themes via `ThemeProvider`.

### 7.2 Form Inputs & Validation
- Validate user inputs (e.g. email formats, numeric OTPs) using validator utilities (`email_validator`, `validators`).
- Prevent multiple form submissions by disabling buttons during async HTTP operations.

### 7.3 Camera & Media Handling
- Utilize `mobile_scanner` for QR code decoding in `join_event.dart`.
- Utilize `image_picker` / `camera` packages for capturing verification photos in `friend_verification.dart`. Ensure runtime permissions are requested properly on native platforms.

---

## 8. Verification & Testing Protocols

1. **Linting Check**: Run `flutter analyze`. Fix any warnings or severe lint issues before pushing code.
2. **Widget Tests**: Run `flutter test` to ensure UI components render without exception.
3. **Integration Verification**: Verify backend connectivity and state propagation by testing full login -> join event -> bingo board flow.
