// ignore: unused_import
import 'package:banco_azteca/inicioYregistro/InicioSeccion.dart';
import 'package:banco_azteca/services/notificacion.dart';
import 'package:flutter/material.dart';
import 'package:banco_azteca/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  //para poder inicializar los blidings antes de cada operación asincrona
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationService notificationService = NotificationService();
  await notificationService.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco Azteca',
      home: LoginScreen(), // Cambiar LoginScreen por AuthWrapper
      debugShowCheckedModeBanner: false,
    );
  }
}
