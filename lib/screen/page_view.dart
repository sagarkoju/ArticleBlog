import 'package:flutter/material.dart';
import 'package:vlogpost/data/food_data.dart';

import 'package:vlogpost/model/student.dart';
import 'package:vlogpost/screen/shimmer_effect.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  List<Fruit> fruit = [];

  @override
  void initState() {
    fruit = List.of(fruits);
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int currentPage = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 15.0,
            top: 10,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              '$currentPage/' + '${fruit.length - 1}'.toString(),
              textScaleFactor: 1.5,
            ),
          ),
        ),
        Expanded(
          child: PageView.builder(
              itemCount: fruit.length,
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: ((context, index) {
                return OnBoardingScreen(
                  desc: fruit[index].desc,
                  image: fruit[index].url,
                  title: fruit[index].name,
                );
              })),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 15.0,
            bottom: 10,
          ),
          child: Row(
            children: [
              ...List.generate(
                fruit.length,
                ((index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: DotIndicator(
                      isActive: index == currentPage,
                    ),
                  );
                }),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ShimmerScreen()));
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 300),
                  height: 70,
                  width: (currentPage == (fruit.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(35)),
                  child: (currentPage == (fruit.length - 1))
                      ? const Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      : const Icon(
                          Icons.navigate_next,
                          size: 50,
                          color: Colors.white,
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    )));
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 20 : 5,
      decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.green,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({
    Key? key,
    required this.desc,
    required this.image,
    required this.title,
  }) : super(key: key);
  final String title, desc, image;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.fill,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
