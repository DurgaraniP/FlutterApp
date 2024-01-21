import 'package:flutter/material.dart';

class BookAppointmentPage extends StatelessWidget {
  const BookAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 18),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Book Appointment',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const DoctorInfo(),
              const SizedBox(height: 14),
              const InfoItems(),
              const SizedBox(height: 14),
              const DaySelector(),
              const SizedBox(height: 14),
              const TimeSelector(),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Want a custom schedule?',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text('Request Schedule'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text('Make Appointment'),
              ),
              const SizedBox(height: 8), // Adjusted space
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 48,
          backgroundImage: AssetImage('assets/images/placeholder.png'),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dr. Jonny Wilson',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Dentist',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.blue),
                SizedBox(width: 4),
                Text(
                  'New York, United States',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(width: 4),
                Icon(Icons.star, color: Colors.blue),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class InfoItems extends StatelessWidget {
  const InfoItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildInfoItem(Icons.people, '7,500+', 'Patients'),
        _buildInfoItem(Icons.accessibility, '10+', 'Years Exp.'),
        _buildInfoItem(Icons.star, '4.9+', 'Rating'),
        _buildInfoItem(Icons.rate_review, '4,956', 'Review'),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}

class DaySelector extends StatelessWidget {
  const DaySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Day',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildDayButton('Today', '4 Oct'),
              const SizedBox(width: 10),
              _buildDayButton('Monday', '5 Oct'),
              const SizedBox(width: 10),
              _buildDayButton('Tuesday', '6 Oct'),
              const SizedBox(width: 10),
              _buildDayButton('Wednesday', '7 Oct'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDayButton(String day, String date) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Column(
        children: [
          Text(day),
          Text(date),
        ],
      ),
    );
  }
}

class TimeSelector extends StatelessWidget {
  const TimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Time',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildTimeButton('7:00 PM'),
              const SizedBox(width: 10),
              _buildTimeButton('7:30 PM'),
              const SizedBox(width: 10),
              _buildTimeButton('8:00 PM'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeButton(String time) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Text(time),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: BookAppointmentPage(),
  ));
}
