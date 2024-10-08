import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_wheather_states.dart';
import 'package:wheather_app/models/wheather_model.dart';
import 'package:wheather_app/services/wheather_service.dart';
//import 'package:wheather_app/view/sarchView.dart';

class GetWheatherCubit extends Cubit<WheatherState> {
  GetWheatherCubit() : super(InitialState());
  WheatherModel? wheatherModel;

  getcurrentWheather({required String cityname}) async {
    try {
      wheatherModel =
          await WheatherService().GetCurrentWheather(cityname: cityname);
      emit(WheatherLoadedState(wheatherModel: wheatherModel!));
    } catch (e) {
      emit(WheatherFaliureState());
    }
  }
}
