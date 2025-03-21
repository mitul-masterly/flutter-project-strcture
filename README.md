# flutter-project-strcture

### To Generate Assets and freezed class

- flutter pub run build_runner build --delete-conflicting-outputs
- dart run build_runner build --delete-conflicting-outputs

### Changes instructions

1. Change App Name
2. App Icon
3. Splash Screen
4. Change Package Name
5. Theme Colors
6. Theme Fonts
7. Theme Text Styles
8. Google service file (for Android and iOS)
9. keystore.properties (Android)
10. Generate new jks file(Android)

### Test Cases Coverage

1. brew install lcov (mac OS) //a tool for generating code coverage reports
2. flutter test --coverage // to generate code coverage file.
3. genhtml coverage/lcov.info -o coverage/html // You can generate a human-readable HTML report
4. open coverage/html/index.html // Open the report for mac OS