## Estructura del repositorio
feature1/
┣ domain/
┃ ┣ models/
┃ ┃ ┗ feature1_model.dart
┃ ┣ repository/
┃ ┃ ┗ feature1_repository.dart
┃ ┣ services/
┃ ┃ ┗ feature1_service.dart
┃ ┗ feature1_domain.dart
┣ providers/
┃ ┣ feature1_provider.dart
┃ ┗ providers.dart
┣ screens/
┃ ┣ feature1_screen.dart
┃ ┗ screens.dart
┣ widgets/
┃ ┣ feature1_widget.dart
┃ ┗ widgets.dart
┗ main.dart

The different components in the folder structure are:

Domain → Models — contains all the data models and JSON to/from Dart helper functions
Domain → Repository — contains abstract classes that describe the feature functionality
Domain → Services — contains the actual implementation of the repository
Providers — contains everything related to the state for that particular feature
Screens — contains full screens that have a Scaffold
Widgets — contains all the widgets required for that particular feature