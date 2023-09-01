import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/entities/cart/cart_dish_entity.dart';
import 'package:data/entities/dishes/entities/dish_entity.dart';
import 'package:data/mappers/mappers.dart';
import 'package:data/repositories/cart_repository_impl.dart';
import 'package:data/repositories/dishes_repository_impl.dart';
import 'package:data/repositories/settings_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:domain/use_cases/set_font_size_use_case.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> setupAppLocator() async {
    appLocator.registerLazySingleton<MapperFactory>(
      () => MapperFactory(),
    );

    appLocator.registerLazySingleton<DishEntityAdapter>(
      () => DishEntityAdapter(),
    );

    appLocator.registerLazySingleton<CartDishEntityAdapter>(
      () => CartDishEntityAdapter(),
    );

    await Hive.initFlutter();
    Hive.registerAdapter(
      appLocator.get<DishEntityAdapter>(),
    );
    Hive.registerAdapter(
      appLocator.get<CartDishEntityAdapter>(),
    );

    ///Providers
    appLocator.registerLazySingleton<FirebaseProvider>(
      () => FirebaseProvider(
        mapper: appLocator.get<MapperFactory>(),
      ),
    );

    appLocator.registerLazySingleton<HiveProvider>(
      () => HiveProvider(
        mapper: appLocator.get<MapperFactory>(),
      ),
    );

    appLocator.registerLazySingleton<CartHiveProvider>(
      () => CartHiveProvider(),
    );

    appLocator.registerLazySingleton<SettingsHiveProvider>(
      () => SettingsHiveProvider(),
    );

    ///UseCases
    appLocator.registerLazySingleton<FetchDishesUseCase>(
      () => FetchDishesUseCase(
        dishRepository: appLocator.get<DishesRepository>(),
      ),
    );

    appLocator.registerLazySingleton<FetchCartDishesUseCase>(
      () => FetchCartDishesUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );

    appLocator.registerLazySingleton<AddToCartUseCase>(
      () => AddToCartUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );

    appLocator.registerLazySingleton<RemoveFromCartUseCase>(
      () => RemoveFromCartUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );

    appLocator.registerLazySingleton<CheckThemeUseCase>(
      () => CheckThemeUseCase(
        settingsRepository: appLocator.get<SettingsRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SetThemeUseCase>(
      () => SetThemeUseCase(
        settingsRepository: appLocator.get<SettingsRepository>(),
      ),
    );

    appLocator.registerLazySingleton<CheckFontSizeUseCase>(
      () => CheckFontSizeUseCase(
        settingsRepository: appLocator.get<SettingsRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SetFontSizeUseCase>(
      () => SetFontSizeUseCase(
        settingsRepository: appLocator.get<SettingsRepository>(),
      ),
    );

    ///Repositories
    appLocator.registerLazySingleton<DishesRepository>(
      () => DishesRepositoryImpl(
        firebaseProvider: appLocator.get<FirebaseProvider>(),
        hiveProvider: appLocator.get<HiveProvider>(),
        mapper: appLocator.get<MapperFactory>(),
      ),
    );

    appLocator.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(
        mapper: appLocator.get<MapperFactory>(),
        cartHiveProvider: appLocator.get<CartHiveProvider>(),
      ),
    );

    appLocator.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        settingsHiveProvider: appLocator.get<SettingsHiveProvider>(),
      ),
    );
  }
}
