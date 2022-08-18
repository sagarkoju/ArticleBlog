import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocalJsonScreen extends StatefulWidget {
  const LocalJsonScreen({Key? key}) : super(key: key);

  @override
  State<LocalJsonScreen> createState() => _LocalJsonScreenState();
}

class _LocalJsonScreenState extends State<LocalJsonScreen> {
  List jsonData = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      jsonData = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Read Data From Local Json',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                child: const Text('Load Fruit Data'),
                onPressed: readJson,
              ),
            ),

            // Display the data loaded from data.json
            jsonData.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: jsonData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Text(jsonData[index]["id"])),
                            title: Text(jsonData[index]["name"]),
                            subtitle: Text(jsonData[index]["description"]),
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
