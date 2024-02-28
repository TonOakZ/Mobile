import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanQR extends StatefulWidget {
  const ScanQR({Key? key}) : super(key: key);

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String? scanResult;

  PickedFile? imageFile;

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile;
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _scanQR();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: IconButton(
            iconSize: 200,
            icon: Icon(Icons.photo),
            color: Colors.white,
            onPressed: () {
              _openGallery(context);
            },
          ),
        ),
      ),
    );
  }

  Future<void> _scanQR() async {
    String? result = await scanner.scan();
    setState(() {
      scanResult = result;
    });
  }
}
