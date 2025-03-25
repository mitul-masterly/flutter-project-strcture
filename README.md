# flutter-project-strcture

### To Generate Assets and freezed class

- flutter pub run build_runner build --delete-conflicting-outputs
- dart run build_runner build --delete-conflicting-outputs

### create or update native splash
flutter pub run flutter_native_splash:create


### Changes instructions

1. Change App Name
2. App Icons 
3. Splash Icons(Android -> png/img_splash_logo.png and png/img_android_12_splash_logo.png) (iOS change in launch storyboard)
4. Splash Screen(Used flutter_native_splash for Android)
5. Update android notification icon path in notification service file and manifest file.
6. Change Package Name
7. Theme Colors
8. Theme Fonts
9. Theme Text Styles
10. Google service file (for Android and iOS)
11. keystore.properties (Android)
12. Generate new jks file(Android)

### Test Cases Coverage

1. brew install lcov (mac OS) //a tool for generating code coverage reports
2. flutter test --coverage // to generate code coverage file.
3. genhtml coverage/lcov.info -o coverage/html // You can generate a human-readable HTML report
4. open coverage/html/index.html // Open the report for mac OS