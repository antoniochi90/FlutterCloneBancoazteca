import 'package:banco_azteca/services/notificacion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AvisosScreen extends StatelessWidget {
  final NotificationService _notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 55, 55, 55),
        title: const Text(
          'Avisos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: '',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
              size: 24,
              color: Colors.white,
            ), // Ícono de filtro
            onPressed: () {
              // Acción al presionar el ícono de filtro
              _notificationService.showNotification();
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 29, 28, 28),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'No Leídas (1)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 1),
                  child: Text(
                    '20 de May 2024',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 1, // Cambiar esto según el número de elementos
              itemBuilder: (BuildContext context, int index) {
                return _buildCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Card(
      elevation: 3.0,
      color: Color.fromARGB(154, 122, 122, 122),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Beneficios',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '!Realiza tus sueños con un Crédito en efectivo! Solicítalo Ahora.',
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '20:30 hrs',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOption(String title) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Checkbox(
          value: false,
          onChanged: (value) {},
        ),
      ],
    );
  }

  void _mostrarPanelFiltro(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mostrar Avisos de',
                  style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Seleccionar Todos',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                Divider(color: Colors.grey[700]),
                const SizedBox(height: 2),
                _buildFilterOption('Operaciones'),
                _buildFilterOption('Pagos'),
                _buildFilterOption('Recordatorios'),
                _buildFilterOption('Beneficios'),
                _buildFilterOption('Perfil'),
                _buildFilterOption('Configuración'),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 280, // Ajusta el ancho del botón al ancho disponible
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción al presionar el botón "Aplicar"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            vertical:
                                10), // Ajusta el padding vertical del botón
                      ),
                      child: const Text(
                        'Aplicar',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors
                                .black), // Cambia el tamaño del texto si es necesario
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  } //aca
}
