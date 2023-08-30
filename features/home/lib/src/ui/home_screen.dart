import 'package:another_flushbar/flushbar.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:main_page/src/bloc/main_page_bloc.dart';
import 'package:main_page/src/enums/menu_tab_enum.dart';
import 'package:main_page/src/ui/menu_tab.dart';
import 'package:navigation/navigation.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<MenuTabType> _menuTabs = MenuTabType.values;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return BlocConsumer<MainPageBloc, MainPageState>(
      listenWhen: (MainPageState previous, MainPageState current) =>
          previous.isInternetConnection != current.isInternetConnection,
      listener: (_, MainPageState state) {
        if (!state.isInternetConnection) {
          Flushbar(
            messageText: const Text(
              AppString.isNotInternet,
              style: AppTextTheme.font18Red,
            ),
            flushbarPosition: FlushbarPosition.TOP,
            padding: const EdgeInsets.all(AppPadding.padding20),
            duration: const Duration(seconds: 3),
          ).show(context);
        }
      },
      builder: (_, MainPageState state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.lightPink,
              backgroundColor: AppColors.brightPink,
            ),
          );
        }
        return DefaultTabController(
          length: _menuTabs.length,
          child: SafeArea(
            child: Scaffold(
              body: Column(
                children: <Widget>[
                  TabBar(
                    padding: const EdgeInsets.only(
                      top: AppPadding.padding10,
                    ),
                    indicatorColor: themeData.tabBarTheme.indicatorColor,
                    tabs: _menuTabs
                        .map(
                          (MenuTabType tab) => MenuTab(
                            iconPath: tab.imagePath,
                          ),
                        )
                        .toList(),
                    onTap: (int index) => context.read<MainPageBloc>().add(
                          ChangeCurrentDishesEvent(
                            category: _menuTabs[index].categoryName,
                          ),
                        ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.currentDishes.length,
                      padding: const EdgeInsets.all(AppPadding.padding12),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.6,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return DishTile(
                          dish: state.currentDishes[index],
                          onTap: () {
                            context.navigateTo(
                              DetailedDishScreenRoute(
                                dish: state.currentDishes[index],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
