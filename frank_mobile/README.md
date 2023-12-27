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


domain/models/
Contiene todos los modelos de datos y JSON hacia/desde las funciones auxiliares de Dart
domain/repository/
Contiene clases abstractas que describen la funcionalidad de la característica
domain/services/
Contiene la implementación real del repositorio
providers/
Contiene todo lo relacionado con el estado de esa característica en particular.
screens/
contiene pantallas completas que tienen Scaffold
widgets/
Contiene todos los widgets necesarios para esa característica en particular