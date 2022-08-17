import 'package:flutter/material.dart';
import 'package:vlogpost/model/data_model.dart';
import 'package:vlogpost/service/data_api.dart';

class FutureBuilderScreen extends StatefulWidget {
  const FutureBuilderScreen({Key? key}) : super(key: key);

  @override
  _FutureBuilderScreenState createState() => _FutureBuilderScreenState();
}

class _FutureBuilderScreenState extends State<FutureBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Future Builder in Flutter",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.headline5?.fontSize,
          ),
        ),
      ),
      body: FutureBuilder(
        future: ApiService().getDataModel(),
        builder: (_, AsyncSnapshot snapshot) {
          final List<Datum>? user = snapshot.data;
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            separatorBuilder: (_, __) => const Padding(
              padding: EdgeInsets.all(10.0),
              child: Divider(
                color: Colors.grey,
                height: 10,
              ),
            ),
            itemCount: user!.length,
            itemBuilder: (_, index) {
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.indigo,
                    backgroundImage: NetworkImage(user[index].avatar),
                  ),
                  title: Text(
                    user[index].firstName,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  subtitle: Text(
                    user[index].email,
                    style: const TextStyle(fontSize: 16, color: Colors.black38),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
