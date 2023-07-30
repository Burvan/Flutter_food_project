import 'package:core/di/app_di.dart';
import 'package:data/data.dart';
import 'package:data/mappers/mappers.dart';
import 'package:data/repositories/dishes_repository_impl.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> setupAppLocator() async {
    appLocator.registerLazySingleton<MapperFactory>(
      () => MapperFactory(),
    );

    ///Providers
    appLocator.registerLazySingleton<FirebaseProvider>(
      () => FirebaseProvider(
        mapper: appLocator.get<MapperFactory>(),
      ),
    );

    ///UseCases
    appLocator.registerLazySingleton<FetchDishesUseCase>(
      () => FetchDishesUseCase(
        dishRepository: appLocator.get<DishesRepository>(),
      ),
    );

    ///Repositories
    appLocator.registerLazySingleton<DishesRepository>(
      () => DishesRepositoryImpl(
        firebaseProvider: appLocator.get<FirebaseProvider>(),
      ),
    );
  }
}
