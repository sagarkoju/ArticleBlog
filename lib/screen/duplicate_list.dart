import 'package:flutter/material.dart';
import 'package:vlogpost/model/student.dart';

class DuplicateListScreen extends StatefulWidget {
  const DuplicateListScreen({Key? key}) : super(key: key);

  @override
  State<DuplicateListScreen> createState() => _DuplicateListScreenState();
}

class _DuplicateListScreenState extends State<DuplicateListScreen> {
  

   
  @override
  Widget build(BuildContext context) {
    List<Student> students = [
      Student(name: "Ram Shrestha", rollno: 3, dob: "2003-10-23"),
      Student(name: "Hari Giri", rollno: 4, dob: "2005-01-13"),
      Student(name: "Ram Shrestha", rollno: 6, dob: "1993-03-15"),
      Student(name: "Harry Nakarmi", rollno: 3, dob: "2011-09-05"),
      Student(name: "Hari Giri", rollno: 4, dob: "1993-05-11"),
      Student(name: "Nabin Prajapati", rollno: 7, dob: "1993-05-11"),
      Student(name: "Sanam kc", rollno: 4, dob: "1993-05-11"),
    ];
    var set = <String>{};
    List<Student> duplicateName =
        students.where((student) => set.add(student.name)).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Removing Duplicate from list'),
        centerTitle: true,
      ),
      body: Column(
          children: duplicateName
              .map((e) => Card(
                    child: ListTile(
                      title: Text(e.name),
                      subtitle: Text(e.dob),
                      leading: CircleAvatar(
                        radius: 35,
                        child: Text(
                          e.rollno.toString(),
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}
