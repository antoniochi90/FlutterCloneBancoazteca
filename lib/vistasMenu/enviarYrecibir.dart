import 'package:flutter/material.dart';

class EnviarYRecibirScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enviar y Recibir'),
      ),
      body: const Center(
        child: Text(
          'Pantalla de Enviar y Recibir',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
