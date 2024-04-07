import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlacesLocation {
  PlacesLocation({required this.longitude, required this.address, required this.latitude});

  final double latitude;
  final double longitude;
  final String address;

}


class Place {
  Place({
    required this.title, 
    required this.image, 
    required this.location
  }) : id = uuid.v4();

  final String title;
  final String id;
  final File image;
  final PlacesLocation location;
}
