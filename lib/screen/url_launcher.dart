
// class URLScreen extends StatefulWidget {
//   const URLScreen({Key? key}) : super(key: key);

//   @override
//   State<URLScreen> createState() => _URLScreenState();
// }

// class _URLScreenState extends State<URLScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// /
// /       appBar: AppBar(
//         title: const Text('Url Launcher in Flutter'),
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: ElevatedButton(
//               onPressed: _lauchedfb,
//               child: const Text('open facebook'),
//             ),
//           ),
//           Center(
//             child: ElevatedButton(
//               onPressed: _launchedNumber,
//               child: const Text('Dial Number'),
//             ),
//           ),
//           Center(
//             child: ElevatedButton(
//               onPressed: _launchedlinked,
//               child: const Text('Linkedin Open'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _launchedlinked() async {
//     const url =
//         'https://www.linkedin.com/in/sagar-koju-444442166/'; // or add your URL here
//     if (await canLaunch(url)) {
//       await launch(
//         url,
//         forceSafariVC: false,
//         forceWebView: false,
//       );
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   _launchedNumber() async {
//     String telephoneNumber = '9863180182';
//     String telephoneUrl = "tel:$telephoneNumber";
//     if (await canLaunchUrl(Uri.parse(telephoneUrl))) {
//       await launchUrl(Uri.parse(telephoneUrl),
//           mode: LaunchMode.externalNonBrowserApplication);
//     } else {
//       throw "Error occured trying to call that number.";
//     }
//   }

//   _lauchedfb() async {
//     // Don't use canLaunch because of fbProtocolUrl (fb://)
//     String url =
//         'fb://facewebmodal/f?href=https://www.facebook.com/sagar.koju/';

//     try {
//       bool launched = await launchUrl(Uri.parse(url));
//       // if (!launched) {
//       //   await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
//       // }
//     } catch (e) {
//       print(e);
//       // await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
//     }
//   }
// }
