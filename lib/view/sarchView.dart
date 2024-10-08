import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_wheather_cubit.dart';

class searchView extends StatelessWidget {
  const searchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Search city',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            onFieldSubmitted: (val) async {
              var Getwheathercubit = BlocProvider.of<GetWheatherCubit>(context);
              Getwheathercubit.getcurrentWheather(cityname: val);
              Navigator.of(context).pop();
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              hintText: 'Enter city name',
              suffixIcon: Icon(Icons.search),
              label: Text(
                'search',
              ),
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
