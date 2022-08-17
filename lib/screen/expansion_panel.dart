import 'package:flutter/material.dart';

class ExpansionScreen extends StatefulWidget {
  const ExpansionScreen({Key? key}) : super(key: key);

  @override
  State<ExpansionScreen> createState() => _ExpansionScreenState();
}

class _ExpansionScreenState extends State<ExpansionScreen> {
  final List<Map<String, dynamic>> dataItem = List.generate(
      50,
      (index) => {
            "id": index,
            "title": "Page Number $index",
            "content":
                "Page Number of $index has added on the book. It is very long and you have to expand the tile to see it."
          });
  void _removeItem(int id) {
    setState(() {
      dataItem.removeWhere((element) => element['id'] == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.teal,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        duration: const Duration(milliseconds: 1000),
        content: Text('Item with id $id has been removed from the list')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expanison Tile'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: dataItem.length,
            itemBuilder: (_, index) {
              final item = dataItem[index];
              return Card(
                // this key is required to save and restore ExpansionTile expanded state
                key: PageStorageKey(item['id']),
                // color: Colors.green,
                elevation: 4,
                child: ExpansionTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  childrenPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  expandedCrossAxisAlignment: CrossAxisAlignment.end,
                  maintainState: true,
                  title: Text(item['title']),
                  // contents
                  children: [
                    Text(item['content']),
                    // This button is used to remove this item
                    TextButton.icon(
                      onPressed: () => _removeItem(item['id']),
                      icon: const Icon(Icons.delete),
                      label: const Text(
                        'Remove',
                      ),
                      style: TextButton.styleFrom(primary: Colors.red),
                    )
                  ],
                ),
              );
            }));
  }
}
