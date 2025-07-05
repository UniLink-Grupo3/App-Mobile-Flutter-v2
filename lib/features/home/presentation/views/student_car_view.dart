import 'package:flutter/material.dart';
import 'package:profile_page/features/home/domain/entities/university_student_without_car.dart';

class StudentCardView extends StatelessWidget {
  const StudentCardView({
    super.key, 
    required this.student, 
    this.boarded = false,
    required this.onBoarded,
  });

  final UniversityStudentWithoutCar student;
  final bool boarded;
  final VoidCallback? onBoarded; 

  @override
  Widget build(BuildContext context) {
    return Card(
      color: boarded ? Colors.green.shade50 : null,
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Row(
              children: [
                const Icon(Icons.people, size: 30, color: Color.fromARGB(255, 36, 29, 232)),
                const SizedBox(width: 5),
                Text("${student.numberPeople}", style: TextStyle(fontSize: 23)),
              ],
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(student.image, width: 100, height: 100),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person, size: 20),
                        const SizedBox(width: 5),
                        Text(" ${student.name}"),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.my_location, size: 20),
                        const SizedBox(width: 5),
                        Text(" ${student.pickup}"),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.pin_drop, size: 20),
                        const SizedBox(width: 5),
                        Text(" ${student.destination}"),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.payments, size: 20),
                        const SizedBox(width: 5),
                        Text(" ${student.price}"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${student.code} - ${student.university}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                ),
              ],
            ),
          ),
          if (boarded)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              color: Colors.green,
              child: const Text(
                'Pasajero(s) a bordo',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilledButton(
                onPressed: onBoarded,
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(10),
                ),
                child: const Icon(Icons.check, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}