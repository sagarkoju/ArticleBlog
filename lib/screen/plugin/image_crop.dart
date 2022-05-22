import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageOptions {
  ImageOptions({
    required this.width,
    required this.height,
  });
  final int width;
  final int height;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => hashValues(width, height);

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(other) =>
      other is ImageOptions && other.width == width && other.height == height;

  @override
  String toString() => '$runtimeType(width: $width, height: $height)';
}

class ImageCrop {
  static const _channel = MethodChannel('plugins.lykhonis.com/image_crop');

  static Future<bool> requestPermissions() => _channel
      .invokeMethod<bool>('requestPermissions')
      .then<bool>((result) => result!);

  // static Future<ImageOptions> getImageOptions({
  //   required File file,
  // }) async {
  //   final result = await _channel
  //       .invokeMethod<int>('getImageOptions', {'path': file.path});

  //   return ImageOptions(
  //     width: result!['width']
  //     height: result['height'],
  //   );
  // }

  static Future<File> cropImage({
    required File file,
    required Rect area,
    double? scale,
  }) =>
      _channel.invokeMethod<String>('cropImage', {
        'path': file.path,
        'left': area.left,
        'top': area.top,
        'right': area.right,
        'bottom': area.bottom,
        'scale': scale ?? 1.0,
      }).then<File>((result) async {
        final file = File(result!);
        // if (Platform.isIOS) {
        //   final documentPath = (await getApplicationDocumentsDirectory()).path;
        //   file = await file.copy(
        //       '$documentPath/camera/pictures/${path.basename(file.path)}');
        // }
        return file;
      });

  static Future<File> sampleImage({
    required File file,
    int? preferredSize,
    int? preferredWidth,
    int? preferredHeight,
  }) async {
    assert(() {
      if (preferredSize == null &&
          (preferredWidth == null || preferredHeight == null)) {
        throw ArgumentError(
            'Preferred size or both width and height of a resampled image must be specified.');
      }
      return true;
    }());
    //   final documentPath = (await getApplicationDocumentsDirectory()).path;
    //   file = await file.copy(
    //       '$documentPath/camera/pictures/${path.basename(file.path)}');

    final path = await _channel.invokeMethod<String>('sampleImage', {
      'path': file.path,
      'maximumWidth': preferredSize ?? preferredWidth,
      'maximumHeight': preferredSize ?? preferredHeight,
    });

    return File(path!);
  }
}
