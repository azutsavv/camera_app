import 'package:flutter/material.dart';

class AddPlaces extends StatefulWidget {
  const AddPlaces({super.key});

  @override
  State<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  final _titleController= TextEditingController();

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
              decoration:const  InputDecoration(
                label: Text("Title"),
              ),
              controller: _titleController,
            ),

            const SizedBox(height: 16,),

            ElevatedButton.icon(onPressed: () {
              
            },
            icon: const Icon(Icons.add),
             label: const Text("Add Place"),),

          ],
        ),
      ),
    );
  }
}
