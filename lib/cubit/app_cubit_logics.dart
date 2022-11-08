import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/app_cubit_states.dart';
import 'package:flutter_application_2/cubit/app_cubits.dart';
import 'package:flutter_application_2/pages/detail_page.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/welcome_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: ((context, state) {
          if (state is DetailState) {
            return const DetailsPage();
          }

          if (state is WelcomeState) {
            return const WelcomePage();
          }

          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is LoadedState) {
            return const HomePage();
          }

          return Container();
        }),
      ),
    );
  }
}
