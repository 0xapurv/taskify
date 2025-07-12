# Taskify - Modern Task Management App

<div align="center">


**A beautiful, modern task management application built with Flutter**

[![Flutter](https://img.shields.io/badge/Flutter-3.8.1+-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.8.1+-blue.svg)](https://dart.dev/)
[![Provider](https://img.shields.io/badge/Provider-6.1.2+-orange.svg)](https://pub.dev/packages/provider)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

</div>

## 📱 Screenshots & Demo

### 📸 App Screenshots
<!-- Add your app screenshots here -->
<div align="center">
  
**Main Screen** | **Task Creation** | **Task Completion**
---|---|---
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-07-12 at 23 29 22" src="https://github.com/user-attachments/assets/6cf5b60e-154b-4bc2-98af-eab0d7a69774" /> | <img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-07-12 at 23 28 02" src="https://github.com/user-attachments/assets/b46e74f6-d6cc-4321-bb96-a3a5a5c9f009" /> | <img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-07-12 at 23 29 22" src="https://github.com/user-attachments/assets/bdcb2add-3685-4cd3-818c-d4b6aba4cc58" />

**Update Task** | **Pending Tasks** | **Empty State**
---|---|---
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-07-12 at 23 29 30" src="https://github.com/user-attachments/assets/1703b574-e92c-43f3-91c1-f2771237ec24" /> | <img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-07-12 at 23 29 47" src="https://github.com/user-attachments/assets/0cab8c9d-7c30-422b-a979-ef9e087e6a34" /> | <img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-07-12 at 23 27 58" src="https://github.com/user-attachments/assets/e3c5d74f-171c-4377-a917-61ed51d285f0"/>






</div>

### 🎥 Apk Drive Link

[APK](https://drive.google.com/file/d/1o3ZZpdKaVy7nIs2zYUwkW66OgkENZo0S/view?usp=sharing)

## ✨ Features

### 🎯 Core Functionality
- **Task Management**: Create, edit, delete, and organize tasks with ease
- **Smart Filtering**: Filter tasks by All, Active, or Completed status
- **Task Completion**: Mark tasks as complete with visual feedback and celebration animations
- **Real-time Statistics**: Live task counters for total, active, and completed tasks
- **Data Persistence**: Automatic local storage using SharedPreferences


### 🎨 Modern UI/UX
- **Material Design 3**: Latest Material Design principles and components
- **Dark Theme**: Beautiful dark theme with custom color palette
- **Smooth Animations**: Engaging animations for task interactions and state changes
- **Custom Typography**: Google Fonts integration with Lato font family
- **Responsive Design**: Optimized for various screen sizes and orientations
- **Interactive Elements**: Tappable statistics cards with visual feedback

### 🚀 Performance & Architecture
- **Provider Pattern**: Efficient state management with ChangeNotifier
- **MVVM Architecture**: Clean separation of concerns
- **Optimized Rebuilds**: Smart widget rebuilding for better performance
- **Memory Efficient**: Proper resource management and cleanup

## 🏗️ Architecture

### Project Structure
```
lib/
├── main.dart                 # App entry point
├── models/
│   └── task.dart            # TaskItem data model
├── viewmodels/
│   └── task_view_model.dart # Business logic and state management
├── views/
│   └── home_view.dart       # Main UI components
└── theme/
    └── app_theme.dart       # Custom theming system
```

### Design Patterns

#### MVVM (Model-View-ViewModel)
- **Model**: `TaskItem` - Immutable data structure with JSON serialization
- **View**: `HomeView` - UI components and user interactions
- **ViewModel**: `TaskViewModel` - Business logic and state management

#### State Management
- **Provider Pattern**: Using `ChangeNotifier` for reactive state updates
- **Task Filtering**: Enum-based filtering system (`TaskFilter.all`, `active`, `completed`)
- **Data Persistence**: Automatic saving to SharedPreferences

## 🛠️ Technology Stack

### Core Dependencies
- **Flutter**: 3.8.1+ - Cross-platform UI framework
- **Dart**: 3.8.1+ - Programming language
- **Provider**: 6.1.2 - State management
- **SharedPreferences**: 2.2.3 - Local data persistence
- **Google Fonts**: 6.1.0 - Custom typography
- **Neopop**: 1.0.2 - Modern UI components

### Development Tools
- **Flutter Lints**: 5.0.0 - Code quality and best practices
- **Flutter Launcher Icons**: Custom app icons for all platforms

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.8.1 or higher
- Dart SDK 3.8.1 or higher
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/taskify.git
   cd taskify
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Building for Release

#### Android APK
```bash
flutter build apk --release
```

#### Android App Bundle (Recommended for Play Store)
```bash
flutter build appbundle --release
```

#### iOS
```bash
flutter build ios --release
```

## 📱 Platform Support

- ✅ **Android**: API 21+ (Android 5.0+)
- ✅ **iOS**: iOS 11.0+
- ✅ **Web**: Modern browsers
- ✅ **Desktop**: Windows, macOS, Linux

## 🎨 Customization

### Theme Configuration
The app uses a comprehensive theming system with custom color extensions:

```dart
// Custom color palette
Color get brandRedPrimary => const Color(0xFFEF4444);
Color get taskPendingColor => const Color(0xFFF59E0B);
Color get taskCompletedColor => const Color(0xFF34D399);
```

### Adding New Features
1. **Models**: Add new data structures in `lib/models/`
2. **ViewModels**: Extend business logic in `lib/viewmodels/`
3. **Views**: Create new UI components in `lib/views/`
4. **Theme**: Customize appearance in `lib/theme/app_theme.dart`


**Built with ❤️ using Flutter**

[![Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Powered%20by-Dart-blue.svg)](https://dart.dev/)

</div>
