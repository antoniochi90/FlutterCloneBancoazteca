import 'package:flutter/material.dart';

class CreditoTarjetaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créditos Tarjeta de Crédito'),
      ),
      body: Center(
        child: Text(
          'Pantalla de Créditos Tarjeta de Crédito',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}