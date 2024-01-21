import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListingAppointmentsForm extends StatefulWidget {
  const ListingAppointmentsForm({super.key});

  @override
  _ListingAppointmentsFormState createState() => _ListingAppointmentsFormState();
}
class _ListingAppointmentsFormState extends State<ListingAppointmentsForm> {
  List<String> appointments = [];
  final String apiUrl = 'http://127.0.0.1:8000/doctdrive_app/doctdrive_app/api/appointments/';
  Future<void> fetchAppointments() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        setState(() {
          appointments = List<String>.from(data); // Assuming the API returns a list of strings
        });
      } else {
        throw Exception('Failed to load appointments');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  void initState() {
    super.initState();
    fetchAppointments(); // Fetch appointments when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return ListTile(
            title: Text(appointment),
            onTap: () {
              _navigateToAppointmentDetails(context, appointment);
            },
          );
        },
      ),
    );
  }
  void _navigateToAppointmentDetails(BuildContext context, String appointment) {
    // Navigation logic
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppointmentDetailsScreen(appointment),
      ),
    );
  }
}

class AppointmentDetailsScreen extends StatelessWidget {
  final String appointment;

  const AppointmentDetailsScreen(this.appointment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Details'),
      ),
      body: Center(
        child: Text('Details for $appointment'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ListingAppointmentsForm(),
  ));
}
