import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SpecificAppointmentForm extends StatefulWidget {
  const SpecificAppointmentForm({super.key});

  @override
  _SpecificAppointmentFormState createState() => _SpecificAppointmentFormState();
}

class _SpecificAppointmentFormState extends State<SpecificAppointmentForm> {
  String appointmentDetails = '';
  final String apiUrl = 'http://127.0.0.1:8000/doctdrive_app/doctdrive_app/api/appointments/3/';
  Future<void> fetchSpecificAppointment(String appointmentId) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl$appointmentId'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        setState(() {
          appointmentDetails = data['details'];
        });
      } else {
        throw Exception('Failed to load appointment details');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSpecificAppointment('appointmentId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Specific Appointment'),
      ),
      body: Center(
        child: appointmentDetails.isEmpty
            ? const CircularProgressIndicator()
            : Text(appointmentDetails),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SpecificAppointmentForm(),
  ));
}
