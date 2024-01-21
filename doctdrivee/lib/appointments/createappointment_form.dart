import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateAppointmentForm extends StatefulWidget {
  const CreateAppointmentForm({super.key});

  @override
  _CreateAppointmentFormState createState() => _CreateAppointmentFormState();
}

class _CreateAppointmentFormState extends State<CreateAppointmentForm> {
  TextEditingController appointmentController = TextEditingController();
  bool isCreatingAppointment = false;
  final String apiUrl = 'http://127.0.0.1:8000/doctdrive_app/doctdrive_app/api/appointments/create/';
  Future<void> createAppointment(String appointmentDetails) async {
    setState(() {
      isCreatingAppointment = true;
    });

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({'details': appointmentDetails}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        print('Appointment created!');
      } else {
        throw Exception('Failed to create appointment');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        isCreatingAppointment = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: appointmentController,
              decoration: const InputDecoration(
                labelText: 'Appointment Details',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isCreatingAppointment
                  ? null
                  : () {
                String details = appointmentController.text;
                if (details.isNotEmpty) {
                  createAppointment(details);
                } else {
                  print('Please enter appointment details');
                }
              },
              child: isCreatingAppointment
                  ? const CircularProgressIndicator()
                  : const Text('Create Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CreateAppointmentForm(),
  ));
}
