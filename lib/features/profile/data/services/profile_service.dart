import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:profile_page/features/profile/data/models/driver_dto.dart';
import 'package:profile_page/features/profile/domain/entities/driver.dart';

class ProfileService{

  Future<Driver> getDriver() async {
    
    final Uri url = Uri.parse('http://localhost:3000/users/1');
    http.Response response = await http.get(url); 
    if (response.statusCode == HttpStatus.ok) {
      final drivermap = jsonDecode(response.body) as Map<String, dynamic>;
      return DriverDto.fromJson(drivermap).toDomain();
    } else {
      throw Exception('Failed to load driver');
    }

  }

}