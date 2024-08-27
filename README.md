# Flutter Mobile App For WordPress REST API V2

## Description

This Flutter project is a mobile application designed to interact with the WordPress REST API V2. The app allows users to view blog posts, post details, categories, and tags directly from a mobile device, providing a user-friendly interface for exploring WordPress content.

## Features

- View blog posts
- View post details
- View categories
- View tags

## Prerequisites

Before you get started, make sure you have the following tools installed:

- [Flutter](https://flutter.dev/docs/get-started/install) (recommended stable version)
- [Dart](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/) with the Flutter plugin

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/aa404/echophare.git
    ```

2. Navigate to the project directory:

    ```bash
    cd echophare
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Configure the API URL in the `lib/config.dart` file:

    ```dart
    const String apiUrl = 'https://www.echophare.com/wp-json/wp/v2/';
    ```

## Usage

To run the app in development mode:

```bash
flutter run
```

To build a production version:

```bash
flutter build apk
```

or for iOS:
```bash
flutter build ios
```

## Contributing

If you'd like to contribute to this project, please follow these steps:

1. **Fork the repository**: Click the "Fork" button on the top right of the repository page to create your own copy of the project.
2. **Create a new branch**: In your local copy of the repository, create a new branch for your changes:
    ```bash
    git checkout -b feature/amazing-feature
    ```
3. **Make your changes**: Implement your feature or fix in your new branch.
4. **Commit your changes**: Save your changes and commit them with a descriptive message:
    ```bash
    git add .
    git commit -m 'Add an amazing feature'
    ```
5. **Push the branch**: Push your changes to your forked repository:
    ```bash
    git push origin feature/amazing-feature
    ```
6. **Open a pull request**: Navigate to the original repository on GitHub and open a pull request to merge your changes.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For any questions or comments, you can reach me at [dev@theringconcept.com](mailto:dev@theringconcept.com).