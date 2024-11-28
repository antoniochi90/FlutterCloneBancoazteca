import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CobrarConQRScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        backgroundColor: const Color.fromARGB(255, 69, 69, 69),
        title: const Center(
            child: Column(
          children: [
            Text(
              'Cobrar con Código QR',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 23),
            Text( 
              'Muestra o Comparte el Código QR',
              style: TextStyle(color: Colors.white, fontSize: 15.5),
            ),
            Text(
              'para reaizar el cobro',
              style: TextStyle(color: Colors.white, fontSize: 15.5),
            )
          ],
        )
            // Espacio entre los títulos y el ícono de compartir

            ),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              Share.share('Texto que quieres compartir');
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 54, 54, 54),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 10,
            ),
            QrImageView(
              data: "Texto para codificar en el QR",
              backgroundColor: Colors.white,
              version: QrVersions.auto,
              size: 300.0,
              gapless: false,
              embeddedImage: const AssetImage(
                  'assets/banco-azteca.png'), // Agrega el logo de Banco Azteca al centro del código QR
            ),
          ]),
          const SizedBox(
              height:
                  24), // Espacio entre el código QR y el texto "Editar monto"
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 130,
              ),
              Text(
                'EDITAR MONTO',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.green,
                size: 40,
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            indent: 30,
            endIndent: 30,
          ),
          const SizedBox(
            height: 25,
          ), // Línea divisora
          const Text(
            '¿Quieres imprimir tu QR? IMPRIMIR QR',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
