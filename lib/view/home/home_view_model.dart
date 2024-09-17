import 'dart:developer';

import 'package:dunwall/core/credentials/credentials.dart';
import 'package:dunwall/core/model/google_places/photos.dart';
import 'package:dunwall/core/model/google_places/place.dart';
import 'package:dunwall/core/model/google_places/results.dart';
import 'package:dunwall/core/network/network.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Map<String, dynamic>> scrollableButtons = [
    {"icon": Icons.history, "title": "Tarihi Yerler"},
    {"icon": Icons.restaurant_menu_outlined, "title": "Restoranlar"},
    {"icon": Icons.park_outlined, "title": "Parklar"},
    {"icon": Icons.museum, "title": "Müzeler"},
    {"icon": Icons.shopping_bag, "title": "Alışveriş Merkezleri"},
  ];

  List<Results> displayPlaces = [];
  List<String> displayedPhotoReference = [];
  List<Image> placeImages = [Image.network('')];

  List<Results> touristAttractionPlaces = [];
  List<Results> restaurantPlaces = [];
  List<Results> parkPlaces = [];
  List<Results> museumPlaces = [];
  List<Results> shoppingMallPlaces = [];

  int _selectedButton = -1;

  int get selectedButton {
    return _selectedButton;
  }

  void setSelectedButton(int value, String filter) {
    if (value == _selectedButton) {
      _selectedButton = -1;
    } else {
      _selectedButton = value;
      switch (_selectedButton) {
        case 0:
          getPlacesForTourist();
          break;
        case 1:
          getPlacesForRestaurant();
          break;
        case 2:
          getPlacesForParks();
          break;
        case 3:
          getPlacesForMuseum();
          break;
        case 4:
          getPlacesForShoppingMall();
          break;
        default:
          'None';
      }
    }
    notifyListeners();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Map<String, dynamic> placeParameters = {
    'radius': 40000,
    'type': 'point_of_interest',
    'location': ['39.923144', '32.838911'],
    'language': 'tr'
  };

  void getLocation() async {
    try {
      Position position = await _determinePosition();
      log("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
      placeParameters['location'] = [position.latitude.toString(), position.longitude.toString()];
    } catch (e) {
      log('hata alındı', error: e);
    }
  }

  List<String> getPhotoReference(List<Results> results) {
    List<String> photoReference = [];
    for (var i = 0; i < results.length; i++) {
      List<Photos>? photos = (results[i].photos);

      if (photos != null) {
        for (var element in photos) {
          photoReference.add(element.photoReference.toString());
        }
      } else {
        photoReference.add('false');
      }
    }
    return photoReference;
  }

  void getPlacesForTourist() async {
    if (touristAttractionPlaces.isEmpty) {
      Map<String, dynamic> placeParametersForTourist = {
        'radius': 10000,
        'type': 'tourist_attraction',
        'location': ['39.940032,32.897326'],
        'language': 'tr',
      };
      try {
        displayPlaces = await Network.getNearbyPlaceResults(placeParametersForTourist);
        displayedPhotoReference = getPhotoReference(displayPlaces);
        getImages(displayedPhotoReference);
      } catch (e) {
        log('places alınırken hata oluştu', error: e);
      }
    } else {
      displayPlaces = touristAttractionPlaces;
      displayedPhotoReference = getPhotoReference(displayPlaces);
      getImages(displayedPhotoReference);
    }

    notifyListeners();
  }

  void getImages(List<String> photoReferences) {
    List<Image> photos = [];
    String baseUrl = 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=';
    try {
      if (photoReferences.isEmpty) {
        return;
      } else {
        for (var reference in photoReferences) {
          photos.add(
            Image.network(
              '$baseUrl$reference&key=${Credentials.apiKey}',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                );
              },
            ),
          );
        }
      }
      placeImages = photos;
    } catch (e) {
      log('fotoğraflar alınırken hata oluştu', error: e);
    }
  }

  void getPlacesForMuseum() async {
    if (museumPlaces.isEmpty) {
      Map<String, dynamic> placeParametersForMuseum = {
        'radius': 10000,
        'type': 'museum',
        'location': ['39.940032,32.897326'],
        'language': 'tr',
      };
      try {
        displayPlaces = await Network.getNearbyPlaceResults(placeParametersForMuseum);
        displayedPhotoReference = getPhotoReference(displayPlaces);
        getImages(displayedPhotoReference);
      } catch (e) {
        log('places alınırken hata oluştu', error: e);
      }
    } else {
      displayPlaces = museumPlaces;
      displayedPhotoReference = getPhotoReference(displayPlaces);
      getImages(displayedPhotoReference);
    }
    notifyListeners();
  }

  void getPlacesForParks() async {
    if (parkPlaces.isEmpty) {
      Map<String, dynamic> placeParametersForParks = {
        'radius': 10000,
        'type': 'amusement_park',
        'location': ['39.940032,32.897326'],
        'language': 'tr',
      };
      try {
        displayPlaces = await Network.getNearbyPlaceResults(placeParametersForParks);
        displayedPhotoReference = getPhotoReference(displayPlaces);
        getImages(displayedPhotoReference);
      } catch (e) {
        log('places alınırken hata oluştu', error: e);
      }
    } else {
      displayPlaces = parkPlaces;
      displayedPhotoReference = getPhotoReference(displayPlaces);
      getImages(displayedPhotoReference);
    }
    notifyListeners();
  }

  void getPlacesForRestaurant() async {
    if (restaurantPlaces.isEmpty) {
      Map<String, dynamic> placeParametersForRestaurant = {
        'radius': 10000,
        'type': 'restaurant',
        'location': ['39.940032,32.897326'],
        'language': 'tr',
      };
      try {
        displayPlaces = await Network.getNearbyPlaceResults(placeParametersForRestaurant);
        displayedPhotoReference = getPhotoReference(displayPlaces);
        getImages(displayedPhotoReference);
      } catch (e) {
        log('places alınırken hata oluştu', error: e);
      }
    } else {
      displayPlaces = restaurantPlaces;
      displayedPhotoReference = getPhotoReference(displayPlaces);
      getImages(displayedPhotoReference);
    }

    notifyListeners();
  }

  void getPlacesForShoppingMall() async {
    if (restaurantPlaces.isEmpty) {
      Map<String, dynamic> placeParametersForRestaurant = {
        'radius': 10000,
        'type': 'shopping_mall',
        'location': ['39.940032,32.897326'],
        'language': 'tr',
      };
      try {
        displayPlaces = await Network.getNearbyPlaceResults(placeParametersForRestaurant);
        displayedPhotoReference = getPhotoReference(displayPlaces);
        getImages(displayedPhotoReference);
      } catch (e) {
        log('places alınırken hata oluştu', error: e);
      }
    } else {
      displayPlaces = shoppingMallPlaces;
      displayedPhotoReference = getPhotoReference(displayPlaces);
      getImages(displayedPhotoReference);
    }

    notifyListeners();
  }

  void getPlaces() async {
    try {
      displayPlaces = await Network.getNearbyPlaceResults(placeParameters);
      displayedPhotoReference = getPhotoReference(displayPlaces);
      getImages(displayedPhotoReference);
    } catch (e) {
      log('places alınırken hata oluştu', error: e);
    }
    notifyListeners();
  }

  Place? currentPlace;
  Future<void> setPlace(Results result) async {
    try {
      currentPlace = Place();
      currentPlace?.id = result.placeId;
      currentPlace?.name = result.name;
      currentPlace?.photoReference = result.photos![0].photoReference ?? 'not_found';
      log('halledildi');
    } catch (e) {
      log('hata aldım setlerken');
    }
  }
}
