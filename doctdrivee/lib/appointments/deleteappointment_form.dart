import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

class DeleteAppointmentForm extends StatefulWidget {
  const DeleteAppointmentForm({super.key});

  @override
  _DeleteAppointmentFormState createState() => _DeleteAppointmentFormState();
}

class _DeleteAppointmentFormState extends State<DeleteAppointmentForm> {
  TextEditingController appointmentIdController = TextEditingController();
  bool isDeletingAppointment = false;
  final String apiUrl = 'http://127.0.0.1:8000/doctdrive_app/doctdrive_app/api/appointments/3/delete/';
  Future<void> deleteAppointment(String appointmentId) async {
    setState(() {
      isDeletingAppointment = true;
    });

    try {
      final response = await http.delete(
        Uri.parse('$apiUrl$appointmentId'),
      );

      if (response.statusCode == 200) {
        print('Appointment deleted!');
      } else {
        throw Exception('Failed to delete appointment');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        isDeletingAppointment = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: appointmentIdController,
              decoration: const InputDecoration(
                labelText: 'Appointment ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isDeletingAppointment
                  ? null
                  : () {
                String appointmentId = appointmentIdController.text;
                if (appointmentId.isNotEmpty) {
                  deleteAppointment(appointmentId);
                } else {
                  print('Please enter appointment ID');
                }
              },
              child: isDeletingAppointment
                  ? const CircularProgressIndicator()
                  : const Text('Delete Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: DeleteAppointmentForm(),
  ));
}
