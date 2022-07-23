import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class ImageSaveScreen extends StatefulWidget {
  const ImageSaveScreen({Key? key}) : super(key: key);

  @override
  State<ImageSaveScreen> createState() => _ImageSaveScreenState();
}

class _ImageSaveScreenState extends State<ImageSaveScreen> {
  String path = 'https://i.ytimg.com/vi/5uShwmVXopc/maxresdefault.jpg';

  saveImage() async {
    await GallerySaver.saveImage(path, toDcim: true, albumName: 'Flutter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Save to Gallery'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.network(
            path,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: const StadiumBorder(),
                textStyle: const TextStyle(fontSize: 20),
                minimumSize: const Size.fromHeight(72),
              ),
              onPressed: () {
                saveImage();
              },
              child: const Text('Download Images to Gallery'),
            ),
          )
        ],
      ),
    );
  }
}
