import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vlogpost/data/food_data.dart';
import 'package:vlogpost/model/student.dart';

class ImageCarasoulScreen extends StatefulWidget {
  const ImageCarasoulScreen({Key? key}) : super(key: key);

  @override
  State<ImageCarasoulScreen> createState() => _ImageCarasoulScreenState();
}

class _ImageCarasoulScreenState extends State<ImageCarasoulScreen> {
  List<Fruit> fruit = [];
  @override
  void initState() {
    fruit = List.from(fruits);
    super.initState();
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Image Carasoul'),
        centerTitle: true,
      ),
      body: Column(children: [
        CarouselSlider(
          items: fruit
              .map(
                (e) => Container(
                  decoration: const BoxDecoration(color: Color(0xff262837)),
                  margin: const EdgeInsets.all(10),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            e.url,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                e.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              )
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2,
              onPageChanged: (index, e) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: fruit.asMap().entries.map((data) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(data.key),
              child: Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 4,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                      .withOpacity(_current == data.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
