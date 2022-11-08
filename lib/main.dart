import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/app_cubit_logics.dart';
import 'package:flutter_application_2/cubit/app_cubits.dart';
import 'package:flutter_application_2/pages/detail_page.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/navpages/main_page.dart';
import 'package:flutter_application_2/pages/welcome_page.dart';
import 'package:flutter_application_2/services/data_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(data: DataServices()),
          child: const AppCubitLogics(),
        ));
  }
}
