// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    DetailedDishScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DetailedDishScreenRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DetailedDishScreen(
          key: args.key,
          dish: args.dish,
        ),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HomeScreen(),
      );
    },
    CartScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CartScreen(),
      );
    },
    OrderHistoryScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrderHistoryScreen(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomePageRoute.name,
          path: '/',
          children: [
            RouteConfig(
              HomeScreenRoute.name,
              path: '',
              parent: HomePageRoute.name,
            ),
            RouteConfig(
              CartScreenRoute.name,
              path: 'cart-screen',
              parent: HomePageRoute.name,
            ),
            RouteConfig(
              OrderHistoryScreenRoute.name,
              path: 'order-history-screen',
              parent: HomePageRoute.name,
            ),
            RouteConfig(
              SettingsScreenRoute.name,
              path: 'settings-screen',
              parent: HomePageRoute.name,
            ),
          ],
        ),
        RouteConfig(
          DetailedDishScreenRoute.name,
          path: '/detailed-dish-screen',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute({List<PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [DetailedDishScreen]
class DetailedDishScreenRoute
    extends PageRouteInfo<DetailedDishScreenRouteArgs> {
  DetailedDishScreenRoute({
    Key? key,
    required Dish dish,
  }) : super(
          DetailedDishScreenRoute.name,
          path: '/detailed-dish-screen',
          args: DetailedDishScreenRouteArgs(
            key: key,
            dish: dish,
          ),
        );

  static const String name = 'DetailedDishScreenRoute';
}

class DetailedDishScreenRouteArgs {
  const DetailedDishScreenRouteArgs({
    this.key,
    required this.dish,
  });

  final Key? key;

  final Dish dish;

  @override
  String toString() {
    return 'DetailedDishScreenRouteArgs{key: $key, dish: $dish}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [CartScreen]
class CartScreenRoute extends PageRouteInfo<void> {
  const CartScreenRoute()
      : super(
          CartScreenRoute.name,
          path: 'cart-screen',
        );

  static const String name = 'CartScreenRoute';
}

/// generated route for
/// [OrderHistoryScreen]
class OrderHistoryScreenRoute extends PageRouteInfo<void> {
  const OrderHistoryScreenRoute()
      : super(
          OrderHistoryScreenRoute.name,
          path: 'order-history-screen',
        );

  static const String name = 'OrderHistoryScreenRoute';
}

/// generated route for
/// [SettingsScreen]
class SettingsScreenRoute extends PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(
          SettingsScreenRoute.name,
          path: 'settings-screen',
        );

  static const String name = 'SettingsScreenRoute';
}
