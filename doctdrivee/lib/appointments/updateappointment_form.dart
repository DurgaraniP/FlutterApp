import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UpdateAppointmentForm extends StatefulWidget {
  const UpdateAppointmentForm({super.key});

  @override
  _UpdateAppointmentFormState createState() => _UpdateAppointmentFormState();
}

class _UpdateAppointmentFormState extends State<UpdateAppointmentForm> {
  TextEditingController appointmentIdController = TextEditingController();
  TextEditingController updatedDetailsController = TextEditingController();
  bool isUpdatingAppointment = false;
  final String apiUrl = 'http://127.0.0.1:8000/doctdrive_app/doctdrive_app/api/appointments/4/update/';
  Future<void> updateAppointment(String appointmentId, String updatedDetails) async {
    setState(() {
      isUpdatingAppointment = true;
    });

    try {
      final response = await http.put(
        Uri.parse('$apiUrl$appointmentId'),
        body: jsonEncode({'updated_details': updatedDetails}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Appointment updated!');
      } else {
        throw Exception('Failed to update appointment');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        isUpdatingAppointment = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Appointment'),
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
            TextField(
              controller: updatedDetailsController,
              decoration: const InputDecoration(
                labelText: 'Updated Details',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isUpdatingAppointment
                  ? null
                  : () {
                String appointmentId = appointmentIdController.text;
                String updatedDetails = updatedDetailsController.text;
                if (appointmentId.isNotEmpty && updatedDetails.isNotEmpty) {
                  updateAppointment(appointmentId, updatedDetails);
                } else {
                  print('Please enter appointment ID and updated details');
                }
              },
              child: isUpdatingAppointment
                  ? const CircularProgressIndicator()
                  : const Text('Update Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: UpdateAppointmentForm(),
  ));
}
