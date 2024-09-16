import 'package:dunwall/view/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: GNav(
          color: Colors.black,
          tabBackgroundColor: Colors.grey,
          gap: 8,
          padding: const EdgeInsets.all(5),
          onTabChange: (value) => context.read<NavigationProvider>().updateIndex(value),
          selectedIndex: context.read<NavigationProvider>().currentIndex,
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search_outlined,
              text: 'Search',
            ),
            GButton(
              icon: Icons.favorite_border_outlined,
              text: 'Favourites',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
