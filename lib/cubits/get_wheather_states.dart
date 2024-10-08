// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wheather_app/models/wheather_model.dart';

class WheatherState {}

class InitialState extends WheatherState {} //initial state

class WheatherLoadedState extends WheatherState {
  final WheatherModel wheatherModel;
  WheatherLoadedState({
    required this.wheatherModel,
  });
}

class WheatherFaliureState extends WheatherState {}
