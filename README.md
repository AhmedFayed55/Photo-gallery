<img width="274" height="585" alt="image" src="https://github.com/user-attachments/assets/b91703b2-deae-4deb-a927-51b6720f7371" />
<img width="272" height="589" alt="image" src="https://github.com/user-attachments/assets/3b9e7c32-113b-40f6-922b-213d7d22e24a" />
<img width="273" height="589" alt="image" src="https://github.com/user-attachments/assets/c73d0f45-9033-468e-be54-86cf71cb8edd" />
<img width="276" height="588" alt="image" src="https://github.com/user-attachments/assets/4d172783-7bbd-44c8-8410-0af090d065ba" />
<img width="273" height="585" alt="image" src="https://github.com/user-attachments/assets/33e05492-cb35-49e5-8e46-dc2cd35a4426" />
<img width="274" height="585" alt="image" src="https://github.com/user-attachments/assets/1254f256-fc97-444e-a8f0-5861f3fc2b3a" />
<img width="276" height="586" alt="image" src="https://github.com/user-attachments/assets/b14b4352-7560-498b-bc05-ed8da3d11b24" />
<img width="273" height="585" alt="image" src="https://github.com/user-attachments/assets/df4da581-8a27-472d-8781-6651054331a5" />
<img width="76" height="34" alt="image" src="https://github.com/user-attachments/assets/ff632f60-48d0-4bce-a9f0-377096986a41" />
<img width="49" height="27" alt="image" src="https://github.com/user-attachments/assets/7c0438e4-5790-415f-9fbf-1c5e86ee9123" />

✅ Setup Instructions
To run the project locally, follow these steps:
run these commands in terminal In order:

1- flutter pub get
2- dart run build_runner build

then run app on emulator.


lib/
├── config/
│   └──  theme/
├── core/
│   ├── network/
│   ├── di/
│   ├── utils/
│   ├── failures/
│   ├── helpers/
│   └── modules/
├── features/
│   └── home_screen/
│       ├── data/
│       │   ├── models/
│       │   ├── data_sources/
│       │   └── repositories_impl/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── pages/
│           ├── widgets/
│           └── manager/
├── features/
│   ├── theme_provider/
│   └── connectivity_provider/
└── main.dart


🏗️ Architecture Overview (Clean Architecture)
This application follows Clean Architecture principles, which promote separation of concerns and scalability.

📦 Layered Structure:
1️⃣ Presentation Layer
features/home_screen/presentation/

Contains all UI components (pages, widgets) and Cubit (state management).

Example:

HomeCubit handles user interactions and state.

HomeScreen displays data and reacts to Cubit state changes.

2️⃣ Domain Layer
features/home_screen/domain/

Contains business logic and contracts (abstract classes).

This layer is independent of any framework or external libraries.

Includes:

Entities (pure models like PhotosEntity)

Repositories (Abstract)

Use Cases — one class per use case, like GetPhotosUseCase.

3️⃣ Data Layer
features/home_screen/data/

Responsible for fetching data from APIs or local DB and transforming it into domain entities.

Includes:

Models: PhotosDto, PhotosHiveDto , generated models

Data Sources:

RemoteDataSource (API via retrofit )

LocalDataSource (Hive)

RepositoriesImpl: Implements the HomeRepository interface and chooses the data source (online/offline).

Core Layer
core/

Contains shared utilities and logic used across multiple features.

Examples:

ApiResult, Failures, AppConstants, DioHelper, etc.

Repository Pattern
The Repository Pattern acts as a bridge between domain and data layers.

It hides implementation details from the domain layer and provides abstraction.

Flow example => 
UI (HomeScreen) 
  → Cubit 
    → UseCase (GetPhotosUseCase)
      → Repository (HomeRepository)
        → Remote or Local DataSource
