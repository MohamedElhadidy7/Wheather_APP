import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/Widgets/nowheather.dart';
import 'package:wheather_app/Widgets/wheatherInfo.dart';
import 'package:wheather_app/cubits/get_wheather_cubit.dart';
import 'package:wheather_app/cubits/get_wheather_states.dart';

import 'package:wheather_app/view/sarchView.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Wheather App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return searchView();
                }));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: BlocBuilder<GetWheatherCubit, WheatherState>(
        builder: (context, state) {
          if (state is InitialState) {
            return noWheather();
          } else if (state is WheatherLoadedState) {
            return wheatherInfo();
          } else {
            return Text('Opps,there was an error');
          }
        },
      ),
    );
  }
}
