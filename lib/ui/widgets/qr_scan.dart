part of "a_widgets.dart";

// Setelah Scan data ada, maka di arahkan ke Page Create Attendance page
class QRScan extends StatefulWidget {
  const QRScan({super.key});

  @override
  State<QRScan> createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Container(
            color: const Color(0xFF0E3311).withOpacity(0.5),
            child: FutureBuilder(
              future: controller?.getFlashStatus(),
              builder: (context, AsyncSnapshot<bool?> snapshot) {
                if (snapshot.data == true) {
                  return IconButton(
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      icon: Icon(Icons.flash_off_rounded));
                } else {
                  return IconButton(
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      icon: Icon(Icons.flash_on_rounded));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 250.0 : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(borderColor: Colors.red, borderRadius: 10, borderLength: 30, borderWidth: 10, cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        if (scanData.code != '') {
          // DateTime _now = DateTime.now();
          // String timeDateTakeQRCode = DateFormat.Hms().format(_now);
          String resultScan = scanData.code!;
          controller.dispose();
          Get.off(() => DetailCreateAttendancePage(resultScanQR: resultScan, timeDateTakeQRCode: '00:00:00'));
        }
      }
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
