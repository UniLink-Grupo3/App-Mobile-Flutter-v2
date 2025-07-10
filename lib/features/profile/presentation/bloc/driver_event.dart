abstract class DriverEvent {

  const DriverEvent();

}

class GetDriverInfo extends DriverEvent {
  final int id;

  const GetDriverInfo({
    required this.id,
  });
}

class UpdateDriverInfo extends DriverEvent {
  final String name;
  final String mail;
  final String university;
  final String car;

  const UpdateDriverInfo({
    required this.name,
    required this.mail,
    required this.university,
    required this.car,
  });
}

