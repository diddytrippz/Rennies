import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:native_pdf_view/native_pdf_view.dart';

class FlutterFlowPdfViewer extends StatefulWidget {
  const FlutterFlowPdfViewer({
    Key key,
    this.networkPath,
    this.assetPath,
    this.width,
    this.height,
    this.horizontalScroll = false,
  })  : assert((networkPath != null) ^ (assetPath != null)),
        super(key: key);

  final String networkPath;
  final String assetPath;
  final double width;
  final double height;
  final bool horizontalScroll;

  @override
  _FlutterFlowPdfViewerState createState() => _FlutterFlowPdfViewerState();
}

class _FlutterFlowPdfViewerState extends State<FlutterFlowPdfViewer> {
  PdfController controller;

  @override
  void initState() {
    super.initState();
    final document = widget.assetPath != null
        ? PdfDocument.openAsset(widget.assetPath)
        : http
            .get(Uri.parse(widget.networkPath))
            .then((response) => PdfDocument.openData(response.bodyBytes));
    controller = PdfController(document: document);
  }

  @override
  Widget build(BuildContext context) => Container(
        width: widget.width,
        height: widget.height,
        child: PdfView(
          controller: controller,
          scrollDirection:
              widget.horizontalScroll ? Axis.horizontal : Axis.vertical,
          documentLoader: const Center(child: CircularProgressIndicator()),
          pageLoader: const Center(child: CircularProgressIndicator()),
          errorBuilder: (_) => Container(),
        ),
      );
}
