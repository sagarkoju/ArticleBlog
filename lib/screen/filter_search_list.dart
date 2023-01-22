import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:vlogpost/data/food_data.dart';
import 'package:vlogpost/model/student.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({Key? key}) : super(key: key);

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  TextEditingController controller = TextEditingController();

  late List<Fruit> fruitslist;
  List<Fruit> result = [];
  @override
  void initState() {
    fruitslist = List.of(fruits);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Filter listView '),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: CupertinoSearchTextField(
              controller: controller,
              onChanged: (value) {
                final fruitValue = fruits.where((e) {
                  final name = e.name.toLowerCase();
                  final querySearch = value.toLowerCase();
                  final description = e.desc.toLowerCase();
                  return name.contains(querySearch) ||
                      description.contains(querySearch);
                }).toList();
                setState(() {
                  fruitslist = fruitValue;
                });
              },
            ),
          ),
          Expanded(
            child: fruitslist.isEmpty
                ? const Center(
                    child: Text(
                    'No Fruit Found',
                    textScaleFactor: 2,
                  ))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: fruitslist.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(fruitslist[index].url),
                        ),
                        title: SubstringHighlight(
                          textStyleHighlight: const TextStyle(
                            color: Colors.black,
                            backgroundColor: Color(0xfff7c46c),
                          ),
                          text: fruitslist[index].name,
                          term: controller.text,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: 0.41,
                              height: 1.3,
                              fontSize: 20),
                        ),
                        subtitle: Text(
                          fruitslist[index].desc,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
