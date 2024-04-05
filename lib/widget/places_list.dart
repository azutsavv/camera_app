import 'package:camera_app/models/places.dart';
import 'package:camera_app/screens/places_deatils.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          "No Data Added",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    else {
      return ListView.builder(

      itemCount: places.length,
      itemBuilder: (context, index) => ListTile(

        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image ),
        ),
        title: Text(
          places[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return PlaceDetails(place: places[index]);
            },
          ));
        },
      ),
    );
    }
  }
}
