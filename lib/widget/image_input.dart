import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onpickimage});

  final void Function(File image)  onpickimage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
 File? _selectedimage ;

  void _takePicture() async{
    final imagePicker = ImagePicker();
    final PickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
      );

    if(PickedImage== null){
      return;
    }

    setState(() {
    _selectedimage = File(PickedImage.path);
      });

    widget.onpickimage(_selectedimage!);

  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
        onPressed: () =>  _takePicture(),
        icon: const Icon(Icons.camera), 
        label:const Text('take Picture')
        );
      
      if(_selectedimage != null){
        content = GestureDetector(
          onTap: _takePicture,
          child: Image.file(
            _selectedimage!, 
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            ),
        );
      }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
          ),

      ),

      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    ) ;
  }
}