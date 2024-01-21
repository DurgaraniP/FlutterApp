// Import if using this file in a Flutter project

class Appointment {
  String appointmentDate;
  String appointmentTime;
  DateTime createdAt;
  DateTime updatedAt;
  int doctorId;
  int userId;
  String description;

  Appointment({
    required this.appointmentDate,
    required this.appointmentTime,
    required this.createdAt,
    required this.updatedAt,
    required this.doctorId,
    required this.userId,
    required this.description,
  });

  @override
  String toString() {
    return 'Appointment{'
        'appointmentDate: $appointmentDate, '
        'appointmentTime: $appointmentTime, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt, '
        'doctorId: $doctorId, '
        'userId: $userId, '
        'description: $description}';
  }
}

class AppointmentsList {
  final List<Appointment> _appointments = [];

  List<Appointment> get appointments => _appointments;

  // Add an appointment
  void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
  }

  // Edit an appointment
  void editAppointment(int index, Appointment updatedAppointment) {
    if (index >= 0 && index < _appointments.length) {
      _appointments[index] = updatedAppointment;
    }
  }

  // Delete an appointment
  void deleteAppointment(int index) {
    if (index >= 0 && index < _appointments.length) {
      _appointments.removeAt(index);
    }
  }
}
