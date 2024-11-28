import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CuentasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: const Color.fromRGBO(71, 71, 71, 1),
        title: const Center(
          child: Text(
            'Cuenta',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Guardadito Digital',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Beneficios',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 14,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Abre una cuenta sin ir a una sucursal',
                      style: TextStyle(color: Colors.white, fontSize: 17))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 14,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Tu dinero Siempre Disponible',
                      style: TextStyle(color: Colors.white, fontSize: 17))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 14,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Solicita y Recibe tu tarjeta fisica',
                      style: TextStyle(color: Colors.white, fontSize: 17))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 14,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Compra de forma segura en internet',
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 32,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Con tu tarjeta Digital*',
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 14,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Abre hasta 5 cuentas',
                      style: TextStyle(color: Colors.white, fontSize: 17))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 1,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 14,
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Text(
                      textAlign: TextAlign.left,
                      'Recibe depositos de hasta \$23,000',
                      style: TextStyle(color: Colors.white, fontSize: 17))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                      textAlign: TextAlign.left,
                      'entre todas tus cuentas guardadito Digital*',
                      style: TextStyle(color: Colors.white, fontSize: 17))
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      textAlign: TextAlign.left,
                      '*Monto mensual aproximado, de acuerdo al valor',
                      style: TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
              Row(
                children: [
                  Text('de 3,000 UDIs',
                      style: TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Al Abrir esta cuenta, reconoces haber leído y',
                      style: TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
              Row(
                children: [
                  Text('Aceptado los Terminos y Condiciones.',
                      style: TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.check_box,
                    color: Color.fromARGB(255, 139, 223, 142),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Contratos de Guardadito Digital',
                      style: TextStyle(
                        color: Color.fromARGB(255, 139, 223, 142),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción al presionar el botón "Abrir"
                },
                child: Text(
                  'ABRIR',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(
                      255, 239, 173, 75), // Color de fondo anaranjado
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
