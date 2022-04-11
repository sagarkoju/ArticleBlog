import 'package:flutter/material.dart';
import 'package:vlogpost/Widget/shimmer.dart';
import 'package:vlogpost/data/food_data.dart';
import 'package:vlogpost/model/student.dart';

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  List<Food> food = [];

  @override
  void initState() {
    getFood();
    super.initState();
  }

  Future getFood() async {
    setState(() {
      showEffect = true;
    });
    await Future.delayed(const Duration(seconds: 2), () {});
    food = List.of(foods);
    setState(() {
      showEffect = false;
    });
  }

  bool showEffect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer Effect'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: showEffect ? 8 : food.length,
          itemBuilder: (context, index) {
            if (showEffect) {
              return foodShimmerEffect();
            } else {
              final foodData = food[index];
              return showFoodsList(foodData);
            }
          }),
    );
  }

  Widget showFoodsList(Food food) => Card(
        child: ListTile(
          title: Text(
            food.name,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            food.desc,
            maxLines: 1,
            style: const TextStyle(fontSize: 14),
          ),
          leading: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
              food.url,
            ),
          ),
        ),
      );

  Widget foodShimmerEffect() =>  ListTile(
        title: Align(
          alignment: Alignment.bottomLeft,
          child: ShimmerWidget.rectangular(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 18),
        ),
        subtitle:const  ShimmerWidget.rectangular(height: 14),
        leading: const ShimmerWidget.circular(
          height: 80,
          width: 70,
        ),
      );
}
