# Contributing to amMingo

Thank you for your interest in contributing to amMingo. We welcome improvements, bug fixes, new features, and documentation updates.

This project is an Android-first Flutter application, and contributions should aim to keep the app polished, maintainable, and aligned with the existing design and architecture.

## Code of Conduct

By participating in this project, you agree to:

- be respectful and professional in discussions
- provide constructive feedback
- avoid disruptive or inappropriate behavior
- help maintain a welcoming environment for all contributors

## How to Contribute

### 1. Fork the repository

Create your own fork of the repository and clone it locally.

```bash
git clone https://github.com/<your-username>/ammingo-frontend.git
cd ammingo-frontend
```

### 2. Create a branch

Use a descriptive branch name for your work.

```bash
git checkout -b feature/your-feature-name
```

Examples:
- feature/login-improvement
- fix/qr-scan-bug
- chore/update-dependencies

### 3. Set up the project

Install dependencies:

```bash
flutter pub get
```

Run the app on Android:

```bash
flutter run -d <device-id>
```

### 4. Make your changes

Keep your changes focused and avoid mixing unrelated changes in one pull request.

Preferred practices:
- follow existing Flutter and Dart style conventions
- keep UI changes consistent with the app’s current design language
- write clear commit messages
- add or update tests when appropriate

### 5. Test your changes

Before submitting a pull request, verify that your changes work properly.

Recommended checks:

```bash
flutter analyze
flutter test
```

If you are changing UI or Android-specific behavior, also verify it on an emulator or physical device.

### 6. Submit a pull request

Once your work is ready:

1. Commit your changes
2. Push the branch to your fork
3. Open a pull request with a clear title and description

Your pull request should include:
- a summary of the change
- the reason for the change
- any relevant screenshots or testing notes
- any known limitations

## Contribution Guidelines

### Pull Request Guidelines

- keep PRs focused and reasonably sized
- explain the problem being solved
- mention the testing performed
- ensure the app still builds and runs locally

### Coding Style

- follow Flutter/Dart formatting conventions
- use meaningful widget and variable names
- keep code readable and maintainable
- avoid unnecessary complexity

### UI and UX Guidelines

- maintain a consistent look and feel with the existing app
- prioritize usability on Android devices
- keep interactions intuitive and simple
- ensure new screens or flows are responsive and accessible where possible

### Bug Reports

If you find a bug, please include:

- a clear description of the issue
- steps to reproduce it
- expected behavior
- actual behavior
- device/emulator details if relevant

### Feature Requests

Feature requests are welcome. Please describe:

- the problem the feature solves
- the desired behavior
- any relevant user flow or example scenario

## Need Help?

If you are unsure where to start, feel free to open an issue or ask questions in the repository discussions.

Thank you again for helping improve amMingo.
