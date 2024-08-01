import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        onDetect: (barcode) {
          if (barcode.raw == null) {
            debugPrint("Failed to Scan Barcode");
          } else {
            final code = barcode.raw!;
            debugPrint("Barcode Found! $code");
          }
        },
      ),
    );
  }
}
