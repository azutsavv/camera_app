import 'dart:convert';

import 'package:camera_app/models/places.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onselectlocation});

  final void Function(PlacesLocation location) onselectlocation;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlacesLocation? _pickedLocation;
    var _isgettingLocation = false;

    String get locationImage{
      if(_pickedLocation==null){
        return '';
      }
      final lat = _pickedLocation!.latitude;
      final log = _pickedLocation!.longitude;

      return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$log=&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$log&key=AIzaSyDLcwxUggpPZo8lcbH0TB4Crq5SJjtj4ag'; 
    }

    void _getCurrentLocation() async{
       setState(() {
      _isgettingLocation=true;
       });

      Location location =  Location();

      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

     serviceEnabled = await location.serviceEnabled();
     if (!serviceEnabled) {
       serviceEnabled = await location.requestService();
       if (!serviceEnabled) {
         return;
       }
     }
     
     permissionGranted = await location.hasPermission();
     if (permissionGranted == PermissionStatus.denied) {
       permissionGranted = await location.requestPermission();
       if (permissionGranted != PermissionStatus.granted) {
         return;
       }
     }
     
     setState(() {
       _isgettingLocation =  true;
     });

     locationData = await location.getLocation();
     final lat = locationData.latitude;
     final log = locationData.longitude;
    
     if(lat==null || log==null){
      return; 
     }

     final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$log&key=AIzaSyDLcwxUggpPZo81cbHØTB4Crq5SJjtj4ag');
    
    final Response = await http.get(url);
    final resData = json.decode(Response.body);
    final address = resData['results'][0]['formatted_address'];

     setState(() {
      _pickedLocation = PlacesLocation(
        address:address ,
        latitude: lat,
        longitude: log ,
      );
       _isgettingLocation=false;
     });

     widget.onselectlocation(_pickedLocation!);

    } 

  @override
  Widget build(BuildContext context) {

    Widget previewContent = Text(
     'NO location chosen' ,
     style:Theme.of(context).textTheme.bodyLarge!.copyWith(
       color: Theme.of(context).colorScheme.primary
     ),
     textAlign: TextAlign.center,
     );

    if(_pickedLocation!=null){
      previewContent= Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    if(_isgettingLocation){
      previewContent = const CircularProgressIndicator();
    }
    

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

            child: previewContent,  
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            TextButton.icon(
              onPressed: () => _getCurrentLocation(), 
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