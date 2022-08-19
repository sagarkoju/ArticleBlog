import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("TabBar in flutter"),
            centerTitle: true,
            bottom: const TabBar(
                indicatorColor: Colors.black,
                indicatorWeight: 2.1,
                // labelColor: Colors.white,
                unselectedLabelColor: Colors.red,
                tabs: [
                  Tab(icon: Icon(Icons.home), text: "Home"),
                  Tab(icon: Icon(Icons.search), text: "Search"),
                  Tab(icon: Icon(Icons.shopping_cart), text: "Shopping")
                ]),
          ),
          body: TabBarView(children: [
            const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Text("This is Home Page."),
              ),
            ),
            const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Text("This is Search Page."),
              ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: double.infinity,
              width: double.infinity,
              child: const Center(
                child: Text("This is Shopping Cart Page."),
              ),
            ),
          ])),
    );
  }
}
