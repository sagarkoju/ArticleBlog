import 'package:flutter/material.dart';


class FoldScreen extends StatefulWidget {
  const FoldScreen({Key? key}) : super(key: key);

  @override
  State<FoldScreen> createState() => _FoldScreenState();
}

class _FoldScreenState extends State<FoldScreen> {
  final _formKey = GlobalKey<FormState>();
  final itemcontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  List<Item> item = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fold Method'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextField(
                    controller: itemcontroller,
                    decoration: InputDecoration(
                        hintText: 'Items',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ))),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    controller: pricecontroller,
                    decoration: InputDecoration(
                        hintText: 'Price',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ))),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          item.add(Item(itemcontroller.text,
                              int.parse(pricecontroller.text)));

                          setState(() {
                            itemcontroller.clear();
                            pricecontroller.clear();
                          });
                        }
                      },
                      child: const Text('Submit')),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: DataTable(
                      dataRowColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        Colors.red;
                        return null; // Use the default value.
                      }),
                      sortAscending: true,
                      border:
                          TableBorder(borderRadius: BorderRadius.circular(10)),
                      columns: const [
                        DataColumn(label: Text('Item')),
                        DataColumn(label: Text('Price'))
                      ],
                      rows: [
                        ...item.map((e) => DataRow(cells: [
                              DataCell(Text(e.item)),
                              DataCell(Text(e.price.toString())),
                            ])),
                        DataRow(
                            color: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) =>
                                    states.contains(MaterialState.selected)
                                        ? Colors.red
                                        : Colors.white),
                            cells: [
                              const DataCell(Text(
                                'Total amount',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text(
                                item
                                    .fold<int>(0, (a, b) => a + b.price)
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                            ]),
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}

class Item {
  final String item;
  final int price;
  Item(this.item, this.price);
}
