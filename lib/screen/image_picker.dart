import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vlogpost/screen/crop_picture_screen.dart';

class ImagePickerScreen extends StatefulHookWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? image;

  Future pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg'],
      );

      if (result != null) {
        final file = File(result.files.single.path!);
        setState(() {
          image = file;
        });
      } else {
        return;
      }
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final images = useProvider(profileImageProvider).state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker in Flutter'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              pickImage().then((value) {
                if (image != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CropPictureScreen(
                        image: image!,
                      ),
                    ),
                  );
                } else {
                  Navigator.of(context).pop();
                }
              });
            },
            child: const Text('Pick Image'),
          ),
          Center(
              child: images == null
                  ? const Text('No Image')
                  : Image.file(
                      images,
                      height: 500,
                      fit: BoxFit.fill,
                    )),
        ],
      ),
    );
  }
}
