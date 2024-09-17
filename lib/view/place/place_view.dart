import 'package:dunwall/view/home/home_view.dart';
import 'package:dunwall/view/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceView extends StatefulWidget {
  const PlaceView({super.key});

  @override
  State<PlaceView> createState() => _PlaceViewState();
}

class _PlaceViewState extends State<PlaceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Text(context.read<HomeViewModel>().currentPlace?.name ?? 'İSİM BULAMADIM'),
            ),
          ],
        ),
      ),
    );
  }
}
