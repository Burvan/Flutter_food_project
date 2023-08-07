import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/theme/app_colors.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:main_page/src/bloc/main_page_bloc.dart';
import 'package:main_page/src/enums/menu_tab_enum.dart';
import 'package:main_page/src/ui/menu_tab.dart';
import 'package:navigation/navigation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainPageBloc>(
      create: (_) => MainPageBloc(
        fetchDishesUseCase: appLocator.get<FetchDishesUseCase>(),
      ),
      child: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  _HomeScreen({Key? key}) : super(key: key);

  final List<MenuTabType> _menuTabs = MenuTabType.values;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) {
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
                    padding: const EdgeInsets.only(top: 10),
                    indicatorColor: themeData.tabBarTheme.indicatorColor,
                    tabs: _menuTabs
                        .map(
                          (MenuTabType tab) => MenuTab(
                            iconPath: tab.imagePath,
                          ),
                        )
                        .toList(),
                    onTap: (int index) => context.read<MainPageBloc>().add(
                      ChangeCurrentDishes(
                        category: _menuTabs[index].categoryName,
                      ),
                    ),
                    //isScrollable: true,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.currentDishes.length,
                      padding: const EdgeInsets.all(12),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.6,
                      ),
                      itemBuilder: (context, index) {
                        return DishTile(
                          dish: state.currentDishes[index],
                          onTap: (){
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
