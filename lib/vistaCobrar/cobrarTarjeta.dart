import 'package:flutter/material.dart';

class CobrarTarjetaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cobrar con Tarjeta'),
      ),
      body: const Center(
        child: Text(
          'Pantalla de Cobrar con Tarjeta',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}