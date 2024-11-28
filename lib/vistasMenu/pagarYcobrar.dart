import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:banco_azteca/vistasPagar/Pagarqr.dart';
import 'package:banco_azteca/vistasPagar/creditosTarjetas.dart';
import 'package:banco_azteca/vistasPagar/Servicio.dart';
import 'package:banco_azteca/vistasPagar/pagarCodi.dart';
import 'package:banco_azteca/vistasPagar/prestaPrenda.dart';
import 'package:banco_azteca/vistaCobrar/cobrarCodi.dart';
import 'package:banco_azteca/vistaCobrar/cobrarQr.dart';
import 'package:banco_azteca/vistaCobrar/cobrarTarjeta.dart';

class PagarYCobrarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Pagar y Cobrar',
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 40,
            )),
        actions: [
          IconButton(
              onPressed: () {
                //lo que vaya hacer el boton
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 30,
              ))
        ],
        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
      ),
      backgroundColor: Colors.black,
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Pagar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            buildOptionCard(context, 'Pagar con Código(QR/Barras)',
                Icons.qr_code_scanner, PagarConQRScreen()),
            buildOptionCard(context, 'Créditos de otros', Icons.credit_card,
                CreditoTarjetaScreen()),
            buildOptionCard(
                context, 'Un Servicio', Icons.receipt, ServicioScreen()),
            buildOptionCard(context, 'Presta Prenda', Icons.attach_money,
                PrestaPrendaScreen()),
            buildOptionCard(
                context, 'Con CoDi®', Icons.qr_code_rounded, ConCodiScreen()),
            const SizedBox(height: 20),
            const Text(
              'Cobrar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            buildOptionCard(
                context, 'Con QR', Icons.qr_code, CobrarConQRScreen()),
            buildOptionCard(context, 'A mis contactos', Icons.credit_card,
                CobrarTarjetaScreen()),
            buildOptionCard(context, 'Con CoDi®', Icons.qr_code_rounded,
                CobrarCodiScreen()),
          ],
        ),
      ),
    );
  }

  Widget buildOptionCard(BuildContext context, String title, IconData icon,
      Widget destinationScreen) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5), // Ajusta el margen vertical
      height: 80,
      child: Card(
        color: Colors.grey[800],
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: Icon(
            icon,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destinationScreen),
            );
          },
        ),
      ),
    );
  }
}
