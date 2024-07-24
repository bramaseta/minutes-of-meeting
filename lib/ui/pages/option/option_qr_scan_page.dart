part of "../pages.dart";

class OptionQRScanPage extends StatefulWidget {
  const OptionQRScanPage({super.key});

  @override
  State<OptionQRScanPage> createState() => _OptionQRScanPageState();
}

class _OptionQRScanPageState extends State<OptionQRScanPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: QRScan(),
      ),
    );
  }
}
