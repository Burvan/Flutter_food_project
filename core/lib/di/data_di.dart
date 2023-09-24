import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';
import 'package:data/entities/cart/cart_dish_entity.dart';
import 'package:data/entities/dishes/entities/dish_entity.dart';
import 'package:data/entities/user/user_entity.dart';
import 'package:data/providers/auth_provider.dart';
import 'package:data/repositories/auth_repository_impl.dart';
import 'package:data/repositories/user_repository_impl.dart';
import 'package:data/repositories/cart_repository_impl.dart';
import 'package:data/repositories/dishes_repository_impl.dart';
import 'package:data/repositories/settings_repository_impl.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> setupAppLocator() async {
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
    appLocator.registerLazySingleton<Box<UserEntity>>(
      () => Hive.box<UserEntity>(AppString.userBoxName),
    );
    appLocator.registerLazySingleton<Box<DishEntity>>(
      () => Hive.box<DishEntity>(AppString.dishesBoxName),
    );
    appLocator.registerLazySingleton<Box<CartDishEntity>>(
      () => Hive.box<CartDishEntity>(AppString.cartBoxName),
    );
    appLocator.registerLazySingleton<Box<String>>(
      () => Hive.box<String>(AppString.themeBoxName),
    );
    appLocator.registerLazySingleton<Box<double>>(
      () => Hive.box<double>(AppString.fontSizeBoxName),
    );

    ///Providers
    appLocator.registerLazySingleton<AuthProvider>(
      () => AuthProvider(
        firebaseAuth: appLocator.get<FirebaseAuth>(),
        googleSignIn: appLocator.get<GoogleSignIn>(),
      ),
    );

    appLocator.registerLazySingleton<FirebaseProvider>(
      () => FirebaseProvider(),
    );

    appLocator.registerLazySingleton<HiveProvider>(
      () => HiveProvider(
        userBox: appLocator.get<Box<UserEntity>>(),
        dishBox: appLocator.get<Box<DishEntity>>(),
        cartBox: appLocator.get<Box<CartDishEntity>>(),
        themeBox: appLocator.get<Box<String>>(),
        fontSizeBox: appLocator.get<Box<double>>(),
      ),
    );

    ///UseCases
    appLocator.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(
        authRepository: appLocator.get<AuthRepository>(),
      ),
    );

    appLocator.registerLazySingleton<GoogleSignInUseCase>(
      () => GoogleSignInUseCase(
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
        userRepository: appLocator.get<UserRepository>(),
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
        hiveProvider: appLocator.get<HiveProvider>(),
        authProvider: appLocator.get<AuthProvider>(),
      ),
    );

    appLocator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        hiveProvider: appLocator.get<HiveProvider>(),
      ),
    );

    appLocator.registerLazySingleton<DishesRepository>(
      () => DishesRepositoryImpl(
        firebaseProvider: appLocator.get<FirebaseProvider>(),
        hiveProvider: appLocator.get<HiveProvider>(),
      ),
    );

    appLocator.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(
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
