import 'package:dunwall/view/favourites/favourites_view.dart';
import 'package:dunwall/view/home/home_view.dart';
import 'package:dunwall/view/profile/profile_view.dart';
import 'package:dunwall/view/search/search_view.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  final List<Widget> _pages = [
    const HomeView(),
    const SearchView(),
    const FavouritesView(),
    const ProfileView(),
  ];

  int _currentIndex = 0;

  int get currentIndex {
    return _currentIndex;
  }

  Widget get page {
    return _pages[_currentIndex];
  }

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
