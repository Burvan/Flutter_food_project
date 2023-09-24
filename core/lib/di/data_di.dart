import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/entities/cart/cart_dish_entity.dart';
import 'package:data/entities/dishes/entities/dish_entity.dart';
import 'package:data/entities/user/user_entity.dart';
import 'package:data/mappers/mappers.dart';
import 'package:data/providers/auth_provider.dart';
import 'package:data/repositories/auth_repository_impl.dart';
import 'package:data/repositories/cart_repository_impl.dart';
import 'package:data/repositories/dishes_repository_impl.dart';
import 'package:data/repositories/settings_repository_impl.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> setupAppLocator() async {
    appLocator.registerLazySingleton<MapperFactory>(
      () => MapperFactory(),
    );

    appLocator.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    );

    appLocator.registerLazySingleton<GoogleSignIn>(
      () => GoogleSignIn(),
    );

    appLocator.registerLazySingleton<DishEntityAdapter>(
      () => DishEntityAdapter(),
    );

    appLocator.registerLazySingleton<CartDishEntityAdapter>(
      () => CartDishEntityAdapter(),
    );

    appLocator.registerLazySingleton<UserEntityAdapter>(
      () => UserEntityAdapter(),
    );

    await Hive.initFlutter();
    Hive.registerAdapter(
      appLocator.get<DishEntityAdapter>(),
    );
    Hive.registerAdapter(
      appLocator.get<CartDishEntityAdapter>(),
    );
    Hive.registerAdapter(
      appLocator.get<UserEntityAdapter>(),
    );

    ///Providers
    appLocator.registerLazySingleton<AuthProvider>(
      () => AuthProvider(
        firebaseAuth: appLocator.get<FirebaseAuth>(),
        googleSignIn: appLocator.get<GoogleSignIn>(),
      ),
    );

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

    ///UseCases
    appLocator.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(
        authRepository: appLocator.get<AuthRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SignInUsingGoogleAccUseCase>(
      () => SignInUsingGoogleAccUseCase(
        authRepository: appLocator.get<AuthRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(
        authRepository: appLocator.get<AuthRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(
        authRepository: appLocator.get<AuthRepository>(),
      ),
    );

    appLocator.registerLazySingleton<GetStoredUserUseCase>(
      () => GetStoredUserUseCase(
        authRepository: appLocator.get<AuthRepository>(),
      ),
    );

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

    appLocator.registerLazySingleton<ClearCartUseCase>(
      () => ClearCartUseCase(
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
    appLocator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        mapper: appLocator.get<MapperFactory>(),
        hiveProvider: appLocator.get<HiveProvider>(),
        authProvider: appLocator.get<AuthProvider>(),
      ),
    );

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
        hiveProvider: appLocator.get<HiveProvider>(),
      ),
    );

    appLocator.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        hiveProvider: appLocator.get<HiveProvider>(),
      ),
    );
  }
}
