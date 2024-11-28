import 'package:banco_azteca/home.dart';
import 'package:banco_azteca/services/auth_google.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'inicioYregistro/InicioSeccion.dart';
import 'inicioYregistro/Registro.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  final AuthUser authUser = AuthUser(); // Instancia de AuthUser

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Please authenticate to log in',
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
      );
    } catch (e) {
      print(e);
    }
    if (authenticated) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    }
  }

  Future<void> _loginWithGoogle() async {
    User? user = await authUser.loginGoogle();
    if (user != null) {
      // Inicio de sesión exitoso, navegar a la pantalla de inicio
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    } else {
      // Maneja el caso en que el usuario cancela el inicio de sesión
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Inicio de sesión cancelado')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/fondo.jpg', // Ruta de tu imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              // Permite el desplazamiento
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/logo_bancoazteca_BN.png', // Ruta de tu primer logo
                        height: 120,
                        width: 120,
                      ),
                      ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          'assets/Olimpico.png', // Ruta de tu segundo logo
                          height: 100,
                          width: 100,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 150),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[850]?.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Buenas noches,',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'José',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Entrar con:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ));
                              },
                              icon: const Icon(
                                Icons.password_rounded,
                                color: Colors.black,
                              ),
                              label: const Text(
                                'Contraseña',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.green, // background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25), // rounded corners
                                ),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: _authenticate,
                              icon: const Icon(
                                Icons.fingerprint,
                                color: Colors.black,
                              ),
                              label: const Text(
                                'Huella Digital',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.green, // background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25), // rounded corners
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ));
                              },
                              child: Text(
                                'Registrarse',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              )),
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed:
                                  _loginWithGoogle, // Llama a _loginWithGoogle
                              child: Text(
                                'Continúa con Google',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 70), // Espacio entre los contenedores
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[900]?.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(14.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[700],
                                ),
                                child: ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                    const Color.fromARGB(255, 140, 239, 144),
                                    BlendMode.srcIn,
                                  ),
                                  child: Image.asset(
                                    'assets/dolar.png',
                                    width: 26,
                                    height: 26,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Enviar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[700],
                                  ),
                                  child: ColorFiltered(
                                    colorFilter: const ColorFilter.mode(
                                        Color.fromARGB(255, 138, 201, 140),
                                        BlendMode.srcIn),
                                    child: Image.asset(
                                      'assets/smartphone.png',
                                      width: 25,
                                      height: 25,
                                    ),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Pagar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[700],
                                ),
                                child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                        Color.fromARGB(255, 138, 201, 140),
                                        BlendMode.srcIn),
                                    child: Image.asset(
                                      'assets/iconoAzteca.png',
                                      width: 25,
                                      height: 25,
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Cobrar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[700],
                                    ),
                                    child: ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                          Color.fromARGB(255, 138, 201, 140),
                                          BlendMode.srcIn),
                                      child: Image.asset(
                                        'assets/iconoAzteca2.png',
                                        width: 25,
                                        height: 25,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Retirar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
