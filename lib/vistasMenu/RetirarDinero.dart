import 'package:flutter/material.dart';

class RetirarDineroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retirar Dinero'),
      ),
      body: Center(
        child: Text(
          'Pantalla de Retirar Dinero',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
