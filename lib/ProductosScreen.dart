import 'package:banco_azteca/vistasProductos/CuentasScreen.dart';
import 'package:banco_azteca/vistasProductos/NominasScreen.dart';
import 'package:banco_azteca/vistasProductos/SeparaDineroScreen.dart';
import 'package:flutter/material.dart';
import 'vistasProductos/CreditosScreen.dart';

class ProductosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 55, 55, 55),
          toolbarHeight: 90,
          title: const Center(
            child: Text(
              'Productos',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )),
      body: ProductScreen(),
    );
  }
}

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CashCreditCard(),
        ),
        Expanded(
          child: Container(
            color: Color.fromARGB(255, 55, 55, 55),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                ListTile(
                  icon: Icons.card_travel,
                  title: 'Créditos',
                  subtitle: 'Crédito Nómina Azteca',
                  actionText: '¡Solícitalo ahora!',
                  onTap: () {
                    // Acción a realizar al hacer clic en Créditos
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreditosScreen()),
                    );
                  },
                ),
                const Divider(color: Colors.grey),
                ListTile(
                  icon: Icons.credit_card_rounded,
                  title: 'Cuentas',
                  subtitle: 'Guardadito Digital',
                  actionText: 'Sin comisiones, ni saldo mínimo',
                  onTap: () {
                    // Acción a realizar al hacer clic en Cuentas
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CuentasScreen()),
                    );
                  },
                ),
                const Divider(color: Colors.grey),
                ListTile(
                  icon: Icons.attach_money,
                  title: 'Nómina',
                  subtitle: 'Portabilidad de Nómina',
                  actionText: '¡Pasa tu nómina hoy!',
                  onTap: () {
                    // Acción a realizar al hacer clic en Nómina
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NominaScreen()),
                    );
                  },
                ),
                const Divider(color: Colors.grey),
                ListTile(
                  icon: Icons.savings_outlined,
                  title: 'Separa tu dinero',
                  subtitle: '',
                  actionText: '',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SepararDineroScreen()),
                    );
                  },
                ),
                const Divider(color: Colors.grey),
                ListTile(
                  icon: Icons.savings,
                  title: 'Alcancía',
                  subtitle: 'Alcanza tus Metas',
                  actionText: '',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CashCreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 71, 71, 71),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Crédito en Efectivo',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Pídelo, ¡sin aval ni garantías!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'HAZLO AQUÍ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 231, 180, 104),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 150,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 73, 156, 76),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            child: const Center(
              child: Image(
                  height: 100,
                  width: 100,
                  image: AssetImage('assets/billetes.png')),
            ),
          ),
        ],
      ),
    );
  }
}

class ListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String actionText;
  final VoidCallback onTap;

  ListTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 30.0,
              color: Colors.white,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 16.0), // Espaciado adicional
                  Text(
                    subtitle,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 248, 246, 246),
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0), // Espaciado adicional
                  Text(
                    actionText,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 95, 96, 95),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 40.0,
              color: Color.fromARGB(255, 124, 231, 168),
            ),
          ],
        ),
      ),
    );
  }
}
