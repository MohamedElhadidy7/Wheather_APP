import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_wheather_cubit.dart';
import 'package:wheather_app/models/wheather_model.dart';

class wheatherInfo extends StatelessWidget {
  const wheatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    WheatherModel wheatherModel =
        BlocProvider.of<GetWheatherCubit>(context).wheatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getthemeColor(wheatherModel.condition),
            getthemeColor(wheatherModel.condition)[300]!,
            getthemeColor(wheatherModel.condition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                wheatherModel.cityname,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                  'Updated at: ${wheatherModel.date.hour}: ${wheatherModel.date.minute}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network('https:${wheatherModel.image}'),
                  Text(wheatherModel.temp.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Column(
                    children: [
                      Text('MaxTemp:${wheatherModel.maxtemp.round()}',
                          style: TextStyle(color: Colors.white)),
                      Text('MinTemp:${wheatherModel.mintemp.round()}',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Text('${wheatherModel.condition}',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

MaterialColor getthemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;

    case 'partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;

    case 'patchy rain possible':
    case 'light rain':
    case 'moderate rain':
    case 'heavy rain':
    case 'patchy light rain':
      return Colors.blue;

    case 'light snow':
    case 'moderate snow':
    case 'heavy snow':
      return Colors.cyan;

    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blueGrey;

    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;

    case 'light sleet':
    case 'moderate or heavy sleet':
      return Colors.blueGrey;

    default:
      return Colors.blue;
  }
}
