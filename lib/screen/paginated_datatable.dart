import 'dart:math';

import 'package:flutter/material.dart';

class PaginatedDataTableScreen extends StatefulWidget {
  const PaginatedDataTableScreen({Key? key}) : super(key: key);

  @override
  State<PaginatedDataTableScreen> createState() =>
      _PaginatedDataTableScreenState();
}

class _PaginatedDataTableScreenState extends State<PaginatedDataTableScreen> {
  final DataTableSource _data = MyData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paginated Data Table'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            PaginatedDataTable(
              source: _data,
              header: const Center(child: Text('My Products List')),
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Price'))
              ],
              columnSpacing: 90,
              horizontalMargin: 60,
              rowsPerPage: 8,
            ),
          ],
        ),
      ),
    );
  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      150,
      (index) => {
            "id": index,
            "title": "Item $index",
            "price": Random().nextInt(35000)
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
    ]);
  }
}
