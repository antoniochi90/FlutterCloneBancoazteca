import 'package:flutter/material.dart';

class TiempoAireScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiempo Aire'),
      ),
      body: Center(
        child: Text(
          'Pantalla de Tiempo Aire',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}