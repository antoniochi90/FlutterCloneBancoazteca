import 'package:banco_azteca/Login.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AjustesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: const Color.fromARGB(255, 73, 72, 72),
        title: const Center(
          child: Column(
            children: [
              Text(
                'Ajustes',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text('Último acceso 20/May/2024 20:02:58 CST',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 55, 55, 55),
      body: ListView(
        children: [
          SizedBox(height: 9),
          ListTile(
            textColor: Colors.white,
            leading: const Icon(
              Icons.account_circle_rounded,
              size: 35,
              color: Colors.white,
            ), // Profile icon
            title: Text('Perfil'),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min, // Wrap the icon in a Row
              children: [
                Icon(Icons.chevron_right,
                    color: Color.fromARGB(255, 32, 231, 115)), // ">" icon
              ],
            ),
            onTap: () {
              // Handle profile option click
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            textColor: Colors.white,
            leading: const Icon(
              Icons.palette_outlined,
              size: 28,
              color: Colors.white,
            ), // Personalize icon
            title: Text('Personalizar mi app'),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min, // Wrap the icon in a Row
              children: [
                Icon(Icons.chevron_right,
                    color: Color.fromARGB(255, 32, 231, 115)), // ">" icon
              ],
            ),
            onTap: () {
              // Handle personalize app option click
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            textColor: Colors.white,
            leading: const Icon(
              Icons.help,
              size: 28,
              color: Colors.white,
            ), // Help icon
            title: Text('Ayuda'),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min, // Wrap the icon in a Row
              children: [
                Icon(Icons.chevron_right,
                    color: Color.fromARGB(255, 32, 231, 115)), // ">" icon
              ],
            ),
            onTap: () {
              // Handle help option click
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            textColor: Colors.white,
            leading: const Icon(
              Icons.logout_rounded,
              size: 28,
              color: Colors.white,
            ), // Exit icon
            title: const Text('Salir de la app'),
            onTap: () async {
              await _signOut(context);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchWhatsApp,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const FaIcon(
          FontAwesomeIcons.whatsapp,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      // Cerrar sesión en Firebase
      await FirebaseAuth.instance.signOut();
      print('Usuario cerrado sesión en Firebase');

      // Cerrar sesión en Google Sign-In
      await GoogleSignIn().signOut();
      print('Usuario cerrado sesión en Google');

      // Redirigir a la pantalla de inicio de sesión
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              LoginScreen(), // Reemplaza con la pantalla de inicio de sesión
        ),
      );
    } catch (e) {
      print('Error al cerrar sesión: $e');
    }
  }

  void _launchWhatsApp() async {
    const phoneNumber =
        '529971425599'; // Reemplaza con tu número de WhatsApp en formato internacional sin el símbolo "+"
    const message =
        'Hola, estoy interesado en obtener más información.'; // Reemplaza con tu mensaje predefinido
    final url =
        'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('No se pudo abrir WhatsApp');
      throw 'No se pudo abrir WhatsApp';
    }
  }
}
