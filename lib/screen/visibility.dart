import 'package:flutter/material.dart';

class VisibilityScreen extends StatefulWidget {
  const VisibilityScreen({Key? key}) : super(key: key);

  @override
  State<VisibilityScreen> createState() => _VisibilityScreenState();
}

class _VisibilityScreenState extends State<VisibilityScreen> {
  bool isClicked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visibility Widget'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isClicked,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: isClicked, 
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Image.network(
                'https://scontent.fktm8-1.fna.fbcdn.net/v/t39.30808-6/277000740_4860211334098026_6444843293679179096_n.jpg?stp=dst-jpg_s960x960&_nc_cat=105&ccb=1-5&_nc_sid=e3f864&_nc_ohc=DLIztIEykVsAX8PDCXj&_nc_ht=scontent.fktm8-1.fna&oh=00_AT-9JLFOwDgOhe4Pr7MpYCX75W-WJElWiv5vvOE_rj6VBw&oe=624B69B4',
                height: 200,
                width: 300,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                child: const Text('Show and Hide')),
          ],
        ),
      ),
    );
  }
}
