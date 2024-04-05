import 'dart:io';

import 'package:camera_app/provider/user_provider.dart';
import 'package:camera_app/widget/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera_app/widget/image_input.dart';
class AddPlaces extends ConsumerStatefulWidget {
  const AddPlaces({super.key});

  ConsumerState<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends ConsumerState<AddPlaces> {
  final _titleController = TextEditingController();
  File? _selectedimage;

  void _savePlaces() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty || _selectedimage == null) {
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle, _selectedimage!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("add new place"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
              controller: _titleController,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 16,
            ),

            ImageInput(onpickimage: (image) {
             _selectedimage = image;  
            },

            ),
            const SizedBox(
              height: 20,
            ),

            LocationInput(),

            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: _savePlaces,
              icon: const Icon(Icons.add),
              label: const Text("Add Place"),
            ),
          ],
        ),
      ),
    );
  }
}
