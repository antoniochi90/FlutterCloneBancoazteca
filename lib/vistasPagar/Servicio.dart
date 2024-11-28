import 'package:flutter/material.dart';

class ServicioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Un Servicio'),
      ),
      body: Center(
        child: Text(
          'Pantalla de Un Servicio',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}