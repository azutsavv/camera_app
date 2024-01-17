import 'package:camera_app/models/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class userPlacesNotifire extends StateNotifier<List<Place>> {
  userPlacesNotifire() : super(const []);

  void addPlace(String title) {
    final newPlace = Place(title: title);
  }
}

final userPlacesProvider = 
            StateNotifierProvider<userPlacesNotifire, List<Place>>(( ref) => userPlacesNotifire());
