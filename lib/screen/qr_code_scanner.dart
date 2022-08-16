// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QrCodeScreen extends StatefulWidget {
//   const QrCodeScreen({Key? key}) : super(key: key);

//   @override
//   State<QrCodeScreen> createState() => _QrCodeScreenState();
// }

// class _QrCodeScreenState extends State<QrCodeScreen> {
//   final GlobalKey _gLobalkey = GlobalKey();
//   QRViewController? controller;
//   Barcode? result;
//   void qr(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((event) {
//       setState(() {
//         result = event;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Qr code Scanner'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 400,
//               width: 400,
//               child: QRView(key: _gLobalkey, onQRViewCreated: qr),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15.0),
//               child: Center(
//                 child: result != null
//                     ? Text('${result!.code}')
//                     : const Text('Scan a code again'),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
