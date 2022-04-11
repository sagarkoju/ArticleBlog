import 'package:flutter/material.dart';
import 'package:vlogpost/model/student.dart';

class GridViewDetailScreen extends StatefulWidget {
  const GridViewDetailScreen({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Food food;
  @override
  State<GridViewDetailScreen> createState() => _GridViewDetailScreenState();
}

class _GridViewDetailScreenState extends State<GridViewDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.name),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.food.desc,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
