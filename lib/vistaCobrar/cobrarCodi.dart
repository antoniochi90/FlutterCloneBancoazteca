import 'package:flutter/material.dart';

class CobrarCodiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cobrar con CoDi®'),
      ),
      body: const Center(
        child: Text(
          'Pantalla de Cobrar con CoDi®',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}