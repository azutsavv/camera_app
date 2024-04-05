import 'package:camera_app/main.dart';
import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              ),
            ),

            child:  Text(
              'NO location chosen' ,
              style:Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary
              ),
              textAlign: TextAlign.center,),

        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            TextButton.icon(
              onPressed: () {
                
              }, 
              icon: const Icon(Icons.location_on), 
              label: const Text("Get Current Location")
            ),

            TextButton.icon(
              onPressed: () {
                
              }, 
              icon: const Icon(Icons.map), 
              label: const Text("Select on Map"))
          ],
        ),
      ],
    );
  }
}