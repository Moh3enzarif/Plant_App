import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:plant_app/screens/qr_overlay.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (barcode) {
              if (barcode.raw == null) {
                debugPrint("Failed to Scan Barcode");
              } else {
                final code = barcode.raw!;
                debugPrint("Barcode Found! $code");
              }
            },
          ),
          QRScannerOverlay(
            overlayColor: Colors.white.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
