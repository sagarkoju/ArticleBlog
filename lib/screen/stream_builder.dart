import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({Key? key}) : super(key: key);

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  Stream<int> generateNumber() async* {
    await Future<void>.delayed(const Duration(seconds: 2));

    for (int i = 1; i <= 10; i++) {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter StreamBuilder Demo'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: StreamBuilder<int>(
            stream: generateNumber(),
            initialData: 0,
            builder: (
              BuildContext context,
              AsyncSnapshot<int> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    Visibility(
                      visible: snapshot.hasData,
                      child: Text(
                        snapshot.data.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  return Text(snapshot.data.toString(),
                      style: const TextStyle(color: Colors.red, fontSize: 40));
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            },
          ),
        ),
      ),
    );
  }
}
