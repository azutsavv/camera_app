import 'dart:io';
import 'package:camera_app/models/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class userPlacesNotifire extends StateNotifier<List<Place>> {
  userPlacesNotifire() : super(const []);

  void addPlace(String title, File image, PlacesLocation location) {
    final newPlace = Place(
    location: location,
    title: title,
    image: image,
    );
    state=[newPlace, ...state];
  }
}

final userPlacesProvider = 
            StateNotifierProvider<userPlacesNotifire, List<Place>>(( ref) => userPlacesNotifire());
