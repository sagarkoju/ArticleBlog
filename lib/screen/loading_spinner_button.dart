import 'package:flutter/material.dart';

class LoadingSpinnerButtonScreen extends StatefulWidget {
  const LoadingSpinnerButtonScreen({Key? key}) : super(key: key);

  @override
  State<LoadingSpinnerButtonScreen> createState() =>
      _LoadingSpinnerButtonScreenState();
}

class _LoadingSpinnerButtonScreenState
    extends State<LoadingSpinnerButtonScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading Spinner Button'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    minimumSize: const Size.fromHeight(72),
                    shape: const StadiumBorder()),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      isLoading = false;
                    });
                  });
                },
                child: isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Loading...',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      )
                    : const Text('Login')),
          )
        ],
      ),
    );
  }
}
