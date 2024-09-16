import 'package:dunwall/core/components/custom_bottom_navigation_bar.dart';
import 'package:dunwall/view/search/search_view.dart';
import 'package:dunwall/view/favourites/favourites_view.dart';
import 'package:dunwall/view/home/home_view.dart';
import 'package:dunwall/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex {
    return _currentIndex;
  }

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

class BaseView extends StatelessWidget {
  final List<Widget> _pages = [
    HomeView(),
    SearchView(),
    const FavouritesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (BuildContext context, NavigationProvider value, Widget? child) {
        return Scaffold(
          body: _pages[value.currentIndex],
          bottomNavigationBar: const CustomBottomNavigationBar(),
        );
      },
    );
  }
}
