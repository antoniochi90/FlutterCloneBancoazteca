import 'package:banco_azteca/DataBase_Sqlite/database_helper.dart';
import 'package:flutter/material.dart';
import '../DataBase_Sqlite/modelDatabase/Payment_model.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  late Future<List<Payment>> _payments;

  @override
  void initState() {
    super.initState();
    _payments = DatabaseHelper().getPayments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 73, 72, 72),
      appBar: AppBar(
        title: const Text(
          'Historial de Pagos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 73, 72, 72),
      ),
      body: FutureBuilder<List<Payment>>(
        future: _payments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No hay pagos registrados',
                    style: TextStyle(color: Colors.white)));
          } else {
            final payments = snapshot.data!;
            return ListView.builder(
              itemCount: payments.length,
              itemBuilder: (context, index) {
                final payment = payments[index];
                return Card(
                  elevation: 4.0,
                  shadowColor: Colors.black,
                  color: const Color.fromARGB(255, 51, 51, 51),
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.attach_money, color: Colors.green),
                            SizedBox(width: 3.0),
                            Text(
                              'Monto: \$${payment.amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.design_services, color: Colors.green),
                            SizedBox(width: 3.0),
                            Text(
                              'Servicio: ${payment.service}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.credit_card, color: Colors.green),
                            SizedBox(width: 3.0),
                            Text(
                              'Tipo: ${payment.paymentType}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.green),
                            SizedBox(width: 3.0),
                            Text(
                              'Cliente: ${payment.persona}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.white38, thickness: 1.0),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // Acción para ver más detalles
                              },
                              child: Text('Ver Detalles',
                                  style: TextStyle(color: Colors.blue)),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            IconButton(
                              onPressed: () {
                                // Acción para eliminar
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
