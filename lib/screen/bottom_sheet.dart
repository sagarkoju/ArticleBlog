import 'package:flutter/material.dart';
import 'package:vlogpost/data/food_data.dart';
import 'package:vlogpost/model/student.dart';

class BotttomShetScreen extends StatefulWidget {
  const BotttomShetScreen({Key? key, required this.widgetContext})
      : super(key: key);

  final BuildContext widgetContext;
  @override
  State<BotttomShetScreen> createState() => _BotttomShetScreenState();
}

class _BotttomShetScreenState extends State<BotttomShetScreen> {
  late List<Fruit> fruitslist;
  @override
  void initState() {
    fruitslist = fruits;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Sheet '),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: widget.widgetContext,
                    isScrollControlled: true,
                    clipBehavior: Clip.antiAlias,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                    builder: (context) {
                      return ShowListTileFruits(fruitslist: fruitslist);
                    });
              },
              child: const Text('Show Bottom Sheet'),
            ),
          )
        ],
      ),
    );
  }
}

class ShowListTileFruits extends StatelessWidget {
  const ShowListTileFruits({
    Key? key,
    required this.fruitslist,
  }) : super(key: key);

  final List<Fruit> fruitslist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: fruitslist.length,
        itemBuilder: ((context, index) {
          return Container(
            color: Colors.grey,
            child: ListTile(
              title: Text(fruitslist[index].name,
                  style: const TextStyle(fontSize: 18)),
              subtitle: Text(fruitslist[index].desc,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 14,
                  )),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(fruitslist[index].url),
              ),
            ),
          );
        }));
  }
}
