import 'package:flutter/material.dart';

class CreditosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: const Color.fromRGBO(71, 71, 71, 1),
          title: const Center(
            child: Text(
              'Nómina Azteca',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.close,
             color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              // Aquí puedes definir la acción al presionar el botón X
              Navigator.pop(context); // Por ejemplo, cerrar la pantalla actual
            },
          ),
        ),
        backgroundColor: Colors.black,
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  textAlign: TextAlign.center,
                  'Pasa tu nómina con nosotros y solicita tu crédito',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                SizedBox(height: 24),
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 10),
                    Text(
                      'Beneficios',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Acceso a un Crédito Inmediato desde \$1,000 pesos sin ir a sucursal',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Disfruta de tus viernes de quincena y retira en cajeros automáticos de cualquier banco del país y te reembolsamos la comisión',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '5% de descuento en Seguros Azteca',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 10),
                    Text(
                      'Solo necesitas pasar tu nómina',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 13,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Ingresa tus datos para brindarte la mejor oferta',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Verifica que tu información sea precisa',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  'Cuánto Recibes:',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixText: '\$',
                      prefixIconColor: Colors.black,
                      filled: true,
                      fillColor: Colors.grey,
                    )),
              ],
            ),
          ),
        ));
  }
}
