# Kilometraje Wialon

App Flutter que consulta el kilometraje y las horas de motor del Buick Skylark Convertible en tiempo real, a través de la [API remota de Wialon](https://sdk.wialon.com/wiki/en/sidebar/remoteapi/apiref/apiref).

## Arquitectura

El proyecto separa la lógica de negocio (`core`) de la presentación (`ui`), organizada por módulos (feature-first):

```
lib/
├── main.dart                     # Entry point, ProviderScope + MaterialApp
├── core/                         # Lógica de negocio (sin dependencias de UI)
│   ├── providers/
│   │   └── providers.dart        # Providers globales (themeProvider, carRepoProvider)
│   ├── modules/
│   │   ├── login/
│   │   │   └── wialon_login.dart # Modelo de respuesta de login
│   │   └── car/
│   │       ├── repository.dart   # CarRepository: requestLogin() y getCarbyId()
│   │       └── wialon_car.dart   # Modelo WialonCar / Item
│   └── services/
│       ├── app_exceptions.dart   # WialonException (mapeo de códigos de error)
│       ├── app_localstorage.dart # Wrapper de shared_preferences
│       └── app_assets.dart       # Rutas de assets
└── ui/                           # Capa de presentación
    ├── modules/
    │   ├── login/
    │   │   ├── login_screen.dart # Pantalla de login
    │   │   └── controller.dart   # LoginController (login + persistencia de eID)
    │   └── car/
    │       ├── car_screen.dart   # Pantalla principal del vehículo
    │       └── controller.dart   # CarController + carByIdProvider (FutureProvider)
    ├── widgets/                  # Botones reutilizables
    └── utils/                    # Tema, colores, tipografías, toasts, formateo
```

## Requisitos

- Flutter 3.41.2 (Dart SDK ^3.9.2)

## Ejecución

```bash
flutter pub get
flutter run
```

## Comandos útiles

```bash
flutter analyze   # Análisis estático
flutter test      # Tests
```

## Notas

- El token de Wialon, el `unitId` y los `flags` están hardcodeados en `lib/core/modules/car/repository.dart` por simplicidad. En un proyecto real deberían moverse a un archivo `.env` o a configuración segura.
