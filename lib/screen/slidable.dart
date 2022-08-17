import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vlogpost/model/student.dart';

class SlidableScreen extends StatefulWidget {
  const SlidableScreen({Key? key}) : super(key: key);

  @override
  State<SlidableScreen> createState() => _SlidableScreenState();
}

class _SlidableScreenState extends State<SlidableScreen> {
  List<Students> student = [];
  @override
  void initState() {
    //adding item to list, you can add using json from network
    student.add(Students(
        id: 1, name: "sparkly", rollno: 4, address: "Kathmandu, Nepal"));
    student.add(Students(
        id: 2, name: "angel", rollno: 45, address: "Kathmandu, Nepal"));
    student.add(Students(
        id: 3, name: "cherub", rollno: 14, address: "Kathmandu, Nepal"));
    student.add(Students(
        id: 4, name: "sweetie", rollno: 4, address: "Kathmandu, Nepal"));
    student.add(
        Students(id: 5, name: "baby", rollno: 9, address: "Kathmandu, Nepal"));
    student.add(Students(
        id: 6, name: "pretty", rollno: 8, address: "Kathmandu, Nepal"));
    student.add(Students(
        id: 7, name: "lovely", rollno: 3, address: "Kathmandu, Nepal"));
    student.add(Students(
        id: 8, name: "Bandalls", rollno: 5, address: "Kathmandu, Nepal"));
    student.add(Students(
        id: 9, name: "Liveltekah", rollno: 43, address: "Kathmandu, Nepal"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slidable In Flutter'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: student.map((e) {
              return Slidable(
                //enable slidable in list
                key: Key(e.id.toString()),

                child: Card(
                  child: ListTile(
                    title: Text(e.name),
                    subtitle: Text('Roll No: ${e.rollno.toString()}'),
                  ),
                ),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      // An action can be bigger than the others.
                      flex: 2,
                      onPressed: (context) {},
                      backgroundColor: const Color(0xFF7BC043),
                      foregroundColor: Colors.white,
                      icon: Icons.archive,
                      label: 'Archive',
                    ),
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: const Color(0xFF0392CF),
                      foregroundColor: Colors.white,
                      icon: Icons.save,
                      label: 'Save',
                    ),
                  ],
                ),

                startActionPane: ActionPane(
                  // A motion is a widget used to control how the pane animates.
                  motion: const ScrollMotion(),

                  // A pane can dismiss the Slidable.
                  dismissible: DismissiblePane(onDismissed: () {}),

                  // All actions are defined in the children parameter.
                  children: [
                    // A SlidableAction can have an icon and/or a label.
                    SlidableAction(
                      onPressed: (context) {
                        student.removeWhere((element) => element.id == e.id);
                        setState(() {});
                      },
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: const Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.share,
                      label: 'Share',
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
