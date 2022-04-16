import 'package:flutter/material.dart';

class DropDownScreen extends StatefulWidget {
  const DropDownScreen({Key? key}) : super(key: key);

  @override
  State<DropDownScreen> createState() => _DropDownScreenState();
}

class _DropDownScreenState extends State<DropDownScreen> {
  List<String> item = [
    'Apple',
    'Banana',
    'Mango',
    'Orange',
    'Grape',
  ];
  String dropdown = 'Apple';
  final _dropdownFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropDown Button in Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _dropdownFormKey,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity / 2,
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.black38,
                  ),
                  borderRadius: BorderRadius.circular(06),
                ),
                child: StatefulBuilder(builder: ((context, setState) {
                  return DropdownButtonFormField<String>(
                    decoration: const InputDecoration(border: InputBorder.none),
                    validator: (value) =>
                        value == null ? "Select a Fruit" : null,
                    // value: dropdown,
                    icon: const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_down)),
                    items: item.map((e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        dropdown = value!;
                      });
                    },
                  );
                })),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_dropdownFormKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Food successfully added'),
                    ),
                  );
                }
              },
              child: const Text("Submit"),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity / 2,
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.black38,
                ),
                borderRadius: BorderRadius.circular(06),
              ),
              child: StatefulBuilder(builder: ((context, setState) {
                return DropdownButton<String>(
                  underline: const SizedBox(),
                  value: dropdown,
                  icon: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.keyboard_arrow_down)),
                  items: item.map((e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdown = value!;
                    });
                  },
                );
              })),
            ),
          ],
        ),
      ),
    );
  }
}
