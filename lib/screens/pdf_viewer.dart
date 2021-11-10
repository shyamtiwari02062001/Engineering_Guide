import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewers extends StatefulWidget {
  const PdfViewers({Key? key}) : super(key: key);
  static const routeName = "/pdfviewer";
  @override
  _PdfViewers createState() => _PdfViewers();
}

class _PdfViewers extends State<PdfViewers> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(args["BookName"]),
      ),
      body: SfPdfViewer.network(
        args["pdfUrl"],
        key: _pdfViewerKey,
      ),
    );
  }
}
