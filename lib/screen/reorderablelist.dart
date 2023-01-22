import 'package:flutter/material.dart';

class ReorderAbleListScreen extends StatefulWidget {
  const ReorderAbleListScreen({Key? key}) : super(key: key);

  @override
  State<ReorderAbleListScreen> createState() => _ReorderAbleListScreenState();
}

class _ReorderAbleListScreenState extends State<ReorderAbleListScreen> {
  List<int> item = List.generate(50, (index) => index);
  @override
  Widget build(BuildContext context) {
    final colorSelection = Theme.of(context).colorScheme;
    final oddColorSelection = colorSelection.primary.withOpacity(0.05);
    final evenColorSelection = colorSelection.primary.withOpacity(0.15);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReorderableListView'),
        centerTitle: true,
      ),
      body: ReorderableListView(
          children: [
            for (int i = 0; i < item.length; i++)
              ListTile(
                key: Key('$i'),
                title: Text('Item ${item[i]}'),
                tileColor:
                    item[i].isOdd ? oddColorSelection : evenColorSelection,
              )
          ],
          onReorder: ((oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex = newIndex + 1;
              }
              final int items = item.removeAt(oldIndex);
              item.insert(newIndex, items);
            });
          })),
    );
  }
}
