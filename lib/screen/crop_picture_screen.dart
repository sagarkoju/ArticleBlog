import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:vlogpost/screen/plugin/crop.dart';
import 'package:vlogpost/screen/plugin/image_crop.dart';

class CropPictureScreen extends StatefulHookWidget {
  CropPictureScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  File image;

  @override
  _CropPictureScreenState createState() => _CropPictureScreenState();
}

class _CropPictureScreenState extends State<CropPictureScreen> {
  final cropKey = GlobalKey<CropState>();
  File? _sample;
  File? _lastCropped;

  @override
  void dispose() {
    super.dispose();
    _sample?.delete();
    _lastCropped?.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Crop.file(
            widget.image,
            key: cropKey,
            chipShape: ChipShape.circle,
            aspectRatio: 1,
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Crop & Edit',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.bold, letterSpacing: 0.5),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Done'),
                onPressed: () {
                  cropImage(
                    cropKey: cropKey,
                    context: context,
                    image: widget.image,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> cropImage({
  required GlobalKey<CropState> cropKey,
  required File image,
  required BuildContext context,
}) async {
  final scale = cropKey.currentState!.scale;
  final area = cropKey.currentState!.area;
  if (area == null) {
    return;
  }

  final sample = await ImageCrop.sampleImage(
    file: image,
    preferredWidth: (1024 / scale).round(),
    preferredHeight: (4096 / scale).round(),
  );

  final file = await ImageCrop.cropImage(
    file: sample,
    area: area,
  );

  context.read(profileImageProvider).state = file;

  Navigator.of(context).pop();
}

final profileImageProvider = StateProvider.autoDispose<File?>((ref) {
  return ProfileImageSelector().profileImage;
});

class ProfileImageSelector {
  // Uint8List? profileImage;
  File? profileImage;
  File? coverImage;
  String? base64ProfileImage;
}
