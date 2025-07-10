import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_page/features/profile/data/services/profile_service.dart';
import 'package:profile_page/features/profile/domain/entities/driver.dart';
import 'package:profile_page/features/profile/presentation/bloc/driver_event.dart';
import 'package:profile_page/features/profile/presentation/bloc/driver_state.dart';

class DriverBloc extends Bloc<DriverEvent, DriverState> {
  
  DriverBloc(): super(InitialDriverSTate()){
    on<GetDriverInfo>((event, emit) async {
      emit(LoadingDriverState());
      try {
        Driver driver = await ProfileService().getDriver();
        emit(LoadedDriverState(driver: driver));
      } catch (e) {
        emit(ErrorDriverState(message: e.toString()));
      }
    });

    on<UpdateDriverInfo>((event, emit) async {
      emit(LoadingDriverState());
      try {
        Driver updatedDriver = Driver(
          id: 1, // Assuming the ID remains the same
          name: event.name,
          university: event.university,
          car: event.car,
        );
        await ProfileService().updateDriver(updatedDriver);
        emit(UpdatedDriverInfoState(driver: updatedDriver));
      } catch (e) {
        emit(ErrorDriverState(message: e.toString()));
      }
    });

  }


}