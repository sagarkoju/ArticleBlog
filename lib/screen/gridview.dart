import 'package:flutter/material.dart';
import 'package:vlogpost/data/food_data.dart';
import 'package:vlogpost/model/student.dart';
import 'package:vlogpost/screen/gridview_detail_screen.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<Food> food = [];

  @override
  void initState() {
    food = List.of(foods);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView in Flutter'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GridView.builder(
              shrinkWrap: true,
              itemCount: food.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (context, index) {
                final dataFood = food[index];
                return showListTileGrid(dataFood);
              })
        ],
      ),
    );
  }

  Widget showListTileGrid(Food food) => Card(
        child: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (_)=>  GridViewDetailScreen(food: food,)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: AssetImage(food.url))),
                ),
              ),
            ),
            Text(food.name)
          ],
        ),
      );
}
