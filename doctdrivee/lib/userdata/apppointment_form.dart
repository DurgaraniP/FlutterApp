import 'package:flutter/material.dart';
import 'package:flutter_auth/userdata/appointment.dart';
// Import your appointments.dart file

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final TextEditingController _appointmentDateController =
      TextEditingController();
  final TextEditingController _appointmentTimeController =
      TextEditingController();
  final TextEditingController _createdAtController = TextEditingController();
  final TextEditingController _updatedAtController = TextEditingController();
  final TextEditingController _doctorIdController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final AppointmentsList _appointmentsList = AppointmentsList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _appointmentDateController,
              decoration: const InputDecoration(labelText: 'Appointment Date'),
            ),
            TextField(
              controller: _appointmentTimeController,
              decoration: const InputDecoration(labelText: 'Appointment Time'),
            ),
            TextField(
              controller: _createdAtController,
              decoration: const InputDecoration(labelText: 'Created At'),
            ),
            TextField(
              controller: _updatedAtController,
              decoration: const InputDecoration(labelText: 'Updated At'),
            ),
            TextField(
              controller: _doctorIdController,
              decoration: const InputDecoration(labelText: 'Doctor ID'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(labelText: 'User ID'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _addAppointment();
                  },
                  child: const Text('Add Appointment'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _editAppointment();
                  },
                  child: const Text('Edit Appointment'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _deleteAppointment();
                  },
                  child: const Text('Delete Appointment'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _appointmentsList.appointments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:
                        Text(_appointmentsList.appointments[index].toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addAppointment() {
    Appointment newAppointment = Appointment(
      appointmentDate: _appointmentDateController.text,
      appointmentTime: _appointmentTimeController.text,
      createdAt: DateTime.parse(_createdAtController.text),
      updatedAt: DateTime.parse(_updatedAtController.text),
      doctorId: int.parse(_doctorIdController.text),
      userId: int.parse(_userIdController.text),
      description: _descriptionController.text,
    );

    setState(() {
      _appointmentsList.addAppointment(newAppointment);
    });
  }

  void _editAppointment() {
    // Assuming you want to edit the first appointment for demonstration purposes
    if (_appointmentsList.appointments.isNotEmpty) {
      Appointment updatedAppointment = Appointment(
        appointmentDate: _appointmentDateController.text,
        appointmentTime: _appointmentTimeController.text,
        createdAt: DateTime.parse(_createdAtController.text),
        updatedAt: DateTime.parse(_updatedAtController.text),
        doctorId: int.parse(_doctorIdController.text),
        userId: int.parse(_userIdController.text),
        description: _descriptionController.text,
      );

      setState(() {
        _appointmentsList.editAppointment(0, updatedAppointment);
      });
    }
  }

  void _deleteAppointment() {
    // Assuming you want to delete the first appointment for demonstration purposes
    if (_appointmentsList.appointments.isNotEmpty) {
      setState(() {
        _appointmentsList.deleteAppointment(0);
      });
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: AppointmentForm(),
  ));
}
