import 'package:dunwall/core/components/custom_bottom_navigation_bar.dart';
import 'package:dunwall/view/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseViewModel>(
      builder: (BuildContext context, BaseViewModel value, Widget? child) {
        return Scaffold(
          body: context.read<BaseViewModel>().page,
          bottomNavigationBar: const CustomBottomNavigationBar(),
        );
      },
    );
  }
}
