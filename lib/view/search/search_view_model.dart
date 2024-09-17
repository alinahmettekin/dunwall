import 'dart:developer';

import 'package:dunwall/core/model/google_places/predictions.dart';
import 'package:dunwall/core/network/network.dart';
import 'package:flutter/foundation.dart';

class SearchViewModel extends ChangeNotifier {
  List<Predictions> predictions = [];

  getPredictions(String input) async {
    try {
      predictions = await Network.getPredictions(input);
    } catch (e) {
      log('hata aldım networkten alırken');
    }
    notifyListeners();
  }

  bool _isRouted = false;

  bool get isRouted {
    return _isRouted;
  }

  bool setIsRouted(value) => _isRouted = value;
}
