import 'package:banco_azteca/historial/payment_history.dart';
import 'package:flutter/material.dart';
import 'package:banco_azteca/ProductosScreen.dart';
import 'package:banco_azteca/AjustesScreen.dart';
import 'package:banco_azteca/AvisosScreen.dart';
import 'package:banco_azteca/pdfCreate.dart';
import 'package:flutter/widgets.dart';
import 'vistasMenu/TiempoAire.dart';
import 'vistasMenu/RetirarDinero.dart';
import 'vistasMenu/enviarYrecibir.dart';
import 'vistasMenu/pagarYcobrar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _menuItems = [
    'Enviar y Recibir',
    'Pagar y Cobrar',
    'Tiempo Aire',
    'Retirar Dinero'
  ];
  final List<String> _accounts = ['**2327', 'BAZ **5632'];
  final String _balance = "\$295,000.98";
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          buildHomeScreen(context),
          ProductosScreen(),
          AvisosScreen(),
          AjustesScreen(),
          PdfCreationScreen(),
          PaymentHistory()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell_rounded),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
            label: 'Avisos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: 'Ajustes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.picture_as_pdf_rounded),
            label: 'Estado de Cuenta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'historial de pagos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 115, 239, 161),
        unselectedItemColor: Colors.grey,
        backgroundColor: Color.fromARGB(255, 55, 55, 55),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget buildHomeScreen(BuildContext context) {
    return Container(
      color: Color.fromARGB(
          255, 20, 20, 20), // Establecer el color de fondo del body a negro
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 37, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 3.0,
              color: const Color.fromARGB(255, 48, 48, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Buenas tardes, Jose',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Operaciones Frecuentes',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 62, 216, 121),
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _menuItems
                  .map((item) => Expanded(child: buildMenuItem(item)))
                  .toList(),
            ),
            Divider(
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            const Text(
              'Cuentas',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                  elevation: 4.0,
                  color: const Color.fromARGB(255, 47, 47, 47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Image(
                                width: 30,
                                height: 30,
                                filterQuality: FilterQuality.high,
                                image: AssetImage('assets/banco-azteca.png'),
                              )),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Mi Debito Banco Azteca',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              _accounts[0],
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              _balance,
                              style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 68, 67, 67),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                popupMenuTheme: const PopupMenuThemeData(
                                  color: Color.fromARGB(255, 64, 65,
                                      65), // Color para todo el popup
                                ),
                              ),
                              child: PopupMenuButton<String>(
                                icon: const Icon(
                                  Icons.more_horiz,
                                  color: Color.fromARGB(255, 60, 215, 140),
                                  size: 23,
                                ),
                                onSelected: (String value) {
                                  // Acción al seleccionar una opción del menú
                                },
                                itemBuilder: (BuildContext context) {
                                  return {'Configuración'}.map((String choice) {
                                    return PopupMenuItem<String>(
                                        padding: const EdgeInsets.all(5.0),
                                        height: 25,
                                        value: choice,
                                        child: Row(children: <Widget>[
                                          const Icon(
                                            Icons.settings,
                                            size: 25,
                                            color: Color.fromARGB(
                                                255, 37, 211, 102),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            choice,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ]));
                                  }).toList();
                                },
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductosScreen() {
    return const Center(
      child: Text(
        'Productos',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }

  Widget buildAvisosScreen() {
    return const Center(
      child: Text(
        'Avisos',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }

  Widget buildAjustesScreen() {
    return const Center(
      child: Text(
        'Ajustes',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }

  Widget buildPdfCreationScreen() {
    return const Center(
      child: Text(
        'Ajustes',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }

  Widget buildHistorialScreen() {
    return const Center(
      child: Text(
        'Ajustes',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }

  Widget buildMenuItem(String text) {
    String imagePath;
    switch (text) {
      case 'Enviar y Recibir':
        imagePath = 'assets/dolar.png';
        break;
      case 'Pagar y Cobrar':
        imagePath = 'assets/pesos.png';
        break;
      case 'Tiempo Aire':
        imagePath = 'assets/zumbido.png';
        break;
      case 'Retirar Dinero':
        imagePath = 'assets/retiro.png';
        break;
      default:
        imagePath = 'assets/Default.png'; // Default icon for unknown items
    }

    Color color;
    switch (text) {
      case 'Enviar y Recibir':
        color = Color.fromARGB(255, 8, 206, 137);
        break;
      case 'Pagar y Cobrar':
        color = const Color.fromARGB(255, 132, 238, 135);
        break;
      case 'Tiempo Aire':
        color = Color.fromARGB(255, 243, 187, 104);
        break;
      case 'Retirar Dinero':
        color = Color.fromARGB(255, 61, 197, 168);
        break;
      default:
        color = Colors.grey; // Default color for unknown items
    }

    return GestureDetector(
      onTap: () {
        switch (text) {
          case 'Enviar y Recibir':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EnviarYRecibirScreen()),
            );
            break;
          case 'Pagar y Cobrar':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PagarYCobrarScreen()),
            );
            break;
          case 'Tiempo Aire':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TiempoAireScreen()),
            );
            break;
          case 'Retirar Dinero':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RetirarDineroScreen()),
            );
            break;
        }
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  imagePath,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
