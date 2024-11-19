import 'package:bankingapp/app/dashboard/dashboard_cubit.dart';
import 'package:bankingapp/app/dashboard/dashboard_screen.dart';
import 'package:bankingapp/app/send_money/send_money_cubit.dart';
import 'package:bankingapp/app/transactions/transactions_cubit.dart';
import 'package:bankingapp/core/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ModularApp(
      module: AppModule(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => Modular.get<DashboardCubit>()),
          BlocProvider(create: (_) => Modular.get<SendMoneyCubit>()),
          BlocProvider(create: (_) => Modular.get<TransactionsCubit>()),
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
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
    );
  }
}
