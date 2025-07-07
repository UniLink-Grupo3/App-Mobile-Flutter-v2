import 'package:flutter/material.dart';
import 'package:profile_page/features/app/data/fake_student_data.dart';
import 'package:profile_page/features/home/presentation/pages/star_trip_page.dart';
import 'package:profile_page/features/trip/presentation/pages/trip_page.dart';
import 'package:profile_page/features/home/domain/entities/university_student_without_car.dart';
import 'package:profile_page/features/profile/presentation/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  final List<UniversityStudentWithoutCar> _students = fakeStudents;

  final List<UniversityStudentWithoutCar> _acceptedStudents = [];
  late final StartTripPage _startTrip;
  late final ProfilePage   _profile;  
  final ValueNotifier<Set<int>> _boardedIds = ValueNotifier(<int>{});
  int _selectedIndex = 0;

  void _handleAccept(UniversityStudentWithoutCar s) {
    if (!_acceptedStudents.contains(s)) {
      setState(() {
        _acceptedStudents.add(s); // lista de aceptados
        _students.remove(s);      // ya no aparecerá como pendiente
      });
    }
  }

  void _handleClear() {
    setState(() {
      _acceptedStudents.clear(); // limpia aceptados
    });
    _boardedIds.value = <int>{}; // ← esto notifica a todos los listeners

    //refrescar lista de pendientes cuando este el backend
    /*
    try {
      final fresh = await ApiClient.fetchPendingStudents();
      setState(() {
      _students
        ..clear()
        ..addAll(fresh);
    });
  } catch (e) {
    debugPrint('Error al recargar pendientes: $e');
  }
    */
  }

  void _handleBoarded(UniversityStudentWithoutCar s) {
    _boardedIds.value = {..._boardedIds.value, s.id};
  }

  @override
  void initState() {
    super.initState();
    _startTrip = StartTripPage(
      students: _students,
      acceptedStudents: _acceptedStudents,
      boardedIds: _boardedIds,
      onAccept: _handleAccept,
    );
    _profile   = const ProfilePage();
  }

  @override
  Widget build(BuildContext context) {
    final tripPage = TripPage(
      acceptedStudents: _acceptedStudents,
      boardedIds: _boardedIds,
      onBoarded: _handleBoarded,
      onClear: _handleClear,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 88, 116, 176),
            ),
            child: Row(
              children: [
                Image.asset('assets/logo.png'),
                const SizedBox(width: 10),
                const Text("RideUp", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Conócenos", style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            _startTrip,
            tripPage,
            _profile,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(88, 116, 176, 1),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.travel_explore), label: 'Trip'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
