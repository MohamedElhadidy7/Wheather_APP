import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_wheather_cubit.dart';
import 'package:wheather_app/cubits/get_wheather_states.dart';
import 'package:wheather_app/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWheatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWheatherCubit, WheatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                // brightness: Brightness.light,
                useMaterial3: false,
                primarySwatch: getthemeColor(
                  BlocProvider.of<GetWheatherCubit>(context)
                      .wheatherModel
                      ?.condition,
                ),
              ),
              home: const homePage(),
            );
          },
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
