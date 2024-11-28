import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfCreationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PDFScreen(
        url:
            'https://drive.google.com/file/d/136BRtFrzG-yDWylcRUEKClIxJmmAzOni/view',
      ),
    );
  }
}

class PDFScreen extends StatelessWidget {
  final String url;

  PDFScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _launchURL(url),
          child: Text('Open PDF'),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
