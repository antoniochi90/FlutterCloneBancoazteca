import 'package:flutter/material.dart';

class PagarConQRScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagar con Código QR'),
      ),
      body: Center(
        child: Text(
          'Pantalla de Pagar con Código QR',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}