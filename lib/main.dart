import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riders_ui/cubit/add_new_rider_cubit/add_new_rider_cubit.dart';
import 'package:riders_ui/cubit/rider_cubit/rider_cubit.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNewRiderCubit()),
        BlocProvider(create: (context) => RiderCubit()),
      ],
      child: const MaterialApp(
        title: 'Riders UI',
        home: HomePage(),
      ),
    );
  }
}
