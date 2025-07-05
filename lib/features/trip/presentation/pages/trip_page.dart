import 'package:flutter/material.dart';
import 'package:profile_page/features/home/domain/entities/university_student_without_car.dart';
import 'package:profile_page/features/home/presentation/views/student_list_view.dart';

class TripPage extends StatefulWidget {
  const TripPage({
    super.key,
    required this.acceptedStudents,
    required this.boardedIds,
    required this.onBoarded,  
    required this.onClear,
  });

  final List<UniversityStudentWithoutCar> acceptedStudents;
  final ValueNotifier<Set<int>> boardedIds;
  final ValueChanged<UniversityStudentWithoutCar> onBoarded;
  final VoidCallback onClear;

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<int>>(
      valueListenable: widget.boardedIds,
      builder: (_, ids, __) {
    if (widget.acceptedStudents.isEmpty) {
      return const Center(
        child: Text(
          "No ha aceptado ninguna solicitud",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }
    return Column(
          children: [
            Expanded(
              child: StudentListView(
                students: widget.acceptedStudents,
                boardedIds: ids,         // Set<int> actualizado
                onBoarded: widget.onBoarded,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: widget.onClear,
                icon: const Icon(Icons.delete),
                label: const Text('Borrar solicitudes'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}