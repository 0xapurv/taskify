# Taskify - Modern Task Management App

<div align="center">

![Taskify Logo](assets/icons/taskify_icon.png)

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
![Main Screen](screenshots/main_screen.png) | ![Task Creation](screenshots/add_task.png) | ![Task Completion](screenshots/task_completed.png)

**Dark Theme** | **Filter View** | **Empty State**
---|---|---
![Dark Theme](screenshots/dark_theme.png) | ![Filter View](screenshots/filter_view.png) | ![Empty State](screenshots/empty_state.png)

</div>

### 🎥 Demo Video
<!-- Add your demo video link here -->
[![Taskify Demo](https://img.youtube.com/vi/YOUR_VIDEO_ID/0.jpg)](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)

**Watch the full demo:** [Taskify App Demo](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)

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

## 📊 Key Features in Detail

### Task Management System
- **Task Creation**: Add tasks with title and optional description
- **Task Editing**: Modify existing tasks inline
- **Task Deletion**: Remove tasks with confirmation
- **Completion Tracking**: Visual indicators and timestamps
- **Bulk Operations**: Clear all completed tasks

### Smart Filtering
- **All Tasks**: View complete task overview
- **Active Tasks**: Focus on pending items
- **Completed Tasks**: Review finished work
- **Real-time Counters**: Live statistics for each category

### Data Persistence
- **Automatic Saving**: Changes saved immediately
- **JSON Serialization**: Efficient data storage
- **Error Handling**: Graceful fallbacks for data corruption
- **Cross-session Persistence**: Data survives app restarts

### Animation System
- **Task Completion**: Celebration animations with confetti effects
- **Smooth Transitions**: Animated state changes
- **Staggered Animations**: Sequential task list animations
- **Interactive Feedback**: Visual responses to user actions

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Commit your changes**: `git commit -m 'Add amazing feature'`
4. **Push to the branch**: `git push origin feature/amazing-feature`
5. **Open a Pull Request**

### Development Guidelines
- Follow Flutter best practices and conventions
- Use meaningful commit messages
- Add tests for new features
- Update documentation as needed
- Follow the existing code style

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Flutter Team**: For the amazing framework
- **Material Design**: For design inspiration
- **Google Fonts**: For beautiful typography
- **Provider Package**: For state management solution

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/taskify/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/taskify/discussions)
- **Email**: your.email@example.com

## 🔗 Links

- **Live Demo**: [Taskify Web App](https://taskify-demo.web.app)
- **Download APK**: [Google Drive](https://drive.google.com/file/d/12ioDPCYEc7T13WjcsYhVc6sD59KK5Rj5/view?usp=sharing)
- **Documentation**: [Wiki](https://github.com/yourusername/taskify/wiki)

---

<div align="center">

**Built with ❤️ using Flutter**

[![Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Powered%20by-Dart-blue.svg)](https://dart.dev/)

</div>
