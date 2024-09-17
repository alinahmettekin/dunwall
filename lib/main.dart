import 'package:dunwall/view/base/base_view.dart';
import 'package:dunwall/view/base/base_view_model.dart';
import 'package:dunwall/view/search/search_view.dart';
import 'package:dunwall/view/search/search_view_model.dart';
import 'package:dunwall/view/home/home_view.dart';
import 'package:dunwall/view/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BaseViewModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        routes: {
          '/homeView': (context) => const HomeView(),
          '/searchView': (context) => SearchView(),
          '/favourites': (context) => SearchView(),
          '/profile': (context) => SearchView(),
        },
        home: BaseView(),
      ),
    );
  }
}
