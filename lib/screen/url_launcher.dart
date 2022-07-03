import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class URLScreen extends StatefulWidget {
  const URLScreen({Key? key}) : super(key: key);

  @override
  State<URLScreen> createState() => _URLScreenState();
}

class _URLScreenState extends State<URLScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Url Launcher in Flutter'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _lauchedfb,
              child: const Text('open facebook'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: _launchedNumber,
              child: const Text('Dial Number'),
            ),
          ),
        ],
      ),
    );
  }

  _launchedNumber() async {
    String telephoneNumber = '9863180182';
    String telephoneUrl = "tel:$telephoneNumber";
    if (await canLaunchUrl(Uri.parse(telephoneUrl))) {
      await launchUrl(Uri.parse(telephoneUrl));
    } else {
      throw "Error occured trying to call that number.";
    }
  }

  _lauchedfb() async {
    // Don't use canLaunch because of fbProtocolUrl (fb://)
    String url =
        'fb://facewebmodal/f?href=https://www.facebook.com/sagar.koju/';

    try {
      bool launched = await launchUrl(Uri.parse(url));
      // if (!launched) {
      //   await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      // }
    } catch (e) {
      print(e);
      // await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }
}
