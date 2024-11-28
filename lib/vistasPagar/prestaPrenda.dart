import 'package:flutter/material.dart';

class PrestaPrendaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presta Prenda'),
      ),
      body: Center(
        child: Text(
          'Pantalla de Presta Prenda',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
