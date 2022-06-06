// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;

  // ignore: use_key_in_widget_constructors
  const MessageWidget({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(12);
    const borderRadius = BorderRadius.all(radius);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: borderRadius
                .subtract(const BorderRadius.only(bottomRight: radius)),
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.black),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
