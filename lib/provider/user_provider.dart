import 'package:camera_app/models/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class userPlacesNotifire extends StateNotifier<List<new_Places>> {
  userPlacesNotifire() : super(const []);

  void addPlace(String title) {
    final newPlace = new_Places(title: title);
  }
}

final userPlacesProvider = 
            StateNotifierProvider<userPlacesNotifire, List<new_Places>>(( ref) => userPlacesNotifire());
