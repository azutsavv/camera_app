import 'package:camera_app/main.dart';
import 'package:camera_app/provider/user_provider.dart';
import 'package:camera_app/screens/add_places.dart';
import 'package:camera_app/widget/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class places extends ConsumerWidget {
  const places({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userplaces = ref.watch(userPlacesProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Places",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: colorScheme.onBackground),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const AddPlaces(),
                  ));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: PlacesList(
            places: userplaces)));
  }
}

