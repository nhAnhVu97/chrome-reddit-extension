# Higo App
-------------
## Getting Started

These instructions will help you get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
- Flutter version: 3.13.6
- Dart version: 3.1.3
  
Before running the project, ensure you have Flutter and Dart installed on your machine. You can find the installation instructions on the [Flutter website](https://flutter.dev/docs/get-started/install).
   
### Installing
1. To generate code runner
   [Build Runner](https://pub.dev/packages/build_runner) 
   ```
   dart run build_runner build --delete-conflicting-outputs
   ```

2. To generate localization
   [Easy Localization](https://pub.dev/packages/easy_localization) 
   ```
   dart run easy_localization:generate -S assets/translations -O lib/generated -f keys -o locale_keys.dart
   ```

3. To add Firebase files
   - Download google-service.json / GoogleService-Info.plist on the Firebase console
   - Add google-service.json / GoogleService-Info.plist to **assets/firebase** (dev,staging, production) folders
   - Run command 
      ```
      dart run flutter_flavorizr -p google:firebase
      ```
