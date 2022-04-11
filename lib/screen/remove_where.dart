import 'package:flutter/material.dart';
import 'package:vlogpost/model/student.dart';

class RemoveWhereScreem extends StatefulWidget {
  const RemoveWhereScreem({Key? key}) : super(key: key);

  @override
  State<RemoveWhereScreem> createState() => _RemoveWhereScreemState();
}

class _RemoveWhereScreemState extends State<RemoveWhereScreem> {
  List<Students> students = [];
  @override
  void initState() {
    students.add(
      Students(
          id: 0, name: 'Sagar Koju', rollno: 730333, address: 'Kamalbinyak-10'),
    );
    students.add(
      Students(
          id: 1,
          name: 'Ram Shrestha',
          rollno: 730334,
          address: 'Bhaktapur-Sallaghari'),
    );
    students.add(
      Students(id: 2, name: 'Shyam Kc', rollno: 730322, address: 'Kathmandu'),
    );
    students.add(
      Students(
          id: 3, name: 'Hari karki', rollno: 730325, address: 'Laltipur-10'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add and Remove Item from List Array'),
      ),
      body: students.isNotEmpty
          ? Center(
              child: Column(
                children: students.map((e) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Card(
                      color: Colors.amberAccent,
                      child: ListTile(
                        title: Text(e.name),
                        subtitle: Text(e.address),
                        trailing: InkWell(
                          onTap: () {
                            students
                                .removeWhere((element) => element.id == e.id);
                            setState(() {});
                          },
                          child: const Icon(Icons.delete),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          : const Center(
              child: Text('Please add text'),
            ),
    );
  }
}
