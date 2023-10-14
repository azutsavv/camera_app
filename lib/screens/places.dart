
import 'package:camera_app/main.dart';
import 'package:camera_app/models/places.dart';
import 'package:camera_app/widget/places_list.dart';
import 'package:flutter/material.dart';

class places extends StatefulWidget {
  const places({super.key});

  @override
  State<places> createState() => _placesState();
}

final List<new_Places> _places=[];

class _placesState extends State<places> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Places",
        style:  Theme.of(context).textTheme.titleLarge!.copyWith(
          color: colorScheme.onBackground
        ),
      
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.add))
        ],
      ),

      body:  PlacesList(places: _places)
    );
  }
}
