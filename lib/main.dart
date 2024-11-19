import 'package:bankingapp/app/dashboard/dashboard_cubit.dart';
import 'package:bankingapp/core/app_module.dart';
import 'package:bankingapp/app/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => Modular.get<DashboardCubit>()),
        ],
        child: const BankingApp(),
      ),
    ),
  );
}

class BankingApp extends StatelessWidget {
  const BankingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: ThemeData.dark(),
      home: const DashboardScreen(),
    );
  }
}
