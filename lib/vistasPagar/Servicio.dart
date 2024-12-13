import 'package:banco_azteca/DataBase_Sqlite/database_helper.dart';
import 'package:banco_azteca/DataBase_Sqlite/modelDatabase/Payment_model.dart';
import 'package:banco_azteca/historial/payment_history.dart';
import 'package:flutter/material.dart';

class ServicioScreen extends StatefulWidget {
  @override
  _ServicioScreenState createState() => _ServicioScreenState();
}

class _ServicioScreenState extends State<ServicioScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _serviceController = TextEditingController();
  final _personaController = TextEditingController();
  final _typeController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _amountController.dispose();
    _serviceController.dispose();
    _personaController.dispose();
    _typeController.dispose();
    super.dispose();
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _savePayment() async {
    if (_formKey.currentState!.validate()) {
      final payment = Payment(
        amount: double.parse(_amountController.text),
        service: _serviceController.text, // Usar el controlador correcto
        paymentType: _typeController.text,
        persona: _personaController.text,
      );
      await DatabaseHelper().insertPayment(payment);

      // Mostrar mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pago registrado exitosamente')),
      );

      // Limpiar el formulario
      _amountController.clear();
      _serviceController.clear();
      _personaController.clear();
      _typeController.clear();
      setState(() {
        _selectedDate = null;
      });

      // Redirigir al historial de pagos
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaymentHistory()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 73, 72, 72),
      appBar: AppBar(
        title: const Text(
          'Realizar Pago',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 73, 72, 72),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Monto',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el monto';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Por favor, ingresa un número válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _personaController,
                decoration: InputDecoration(
                    labelText: 'Nombre de la persona que lo realiza',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _typeController,
                decoration: InputDecoration(
                    labelText: 'Tipo de Pago',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el tipo de pago';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _serviceController,
                decoration: InputDecoration(
                    labelText: 'Servicio a pagar',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa si servicio a pagar';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: _savePayment,
                  child: Text('Guardar Pago'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
