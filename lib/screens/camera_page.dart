import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:plant_app/screens/qr_overlay.dart';
import 'package:plant_app/const/constants.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  MobileScannerController controller = MobileScannerController();
  // required options for the scanner
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
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // X Button
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Constants.textColor.withOpacity(0.9),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Torch Button
                // Container(
                //   height: 40,
                //   width: 40,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(50),
                //     color: Constants.textColor.withOpacity(0.2),
                //   ),
                //   child: IconButton(
                //     color: Colors.white,
                //     icon: ValueListenableBuilder(
                //       valueListenable: controller,
                //       builder: (context, state, child) {
                //         switch (state) {
                //           // ignore: constant_pattern_never_matches_value_type
                //           case TorchState.off:
                //             return const Icon(
                //               Icons.flash_off,
                //               color: Colors.white,
                //             );
                //           // ignore: constant_pattern_never_matches_value_type
                //           case TorchState.on:
                //             return const Icon(
                //               Icons.flash_on,
                //               color: Colors.yellow,
                //             );
                //         }
                //       },
                //     ),
                //     onPressed: () {
                //       controller.toggleTorch();
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
