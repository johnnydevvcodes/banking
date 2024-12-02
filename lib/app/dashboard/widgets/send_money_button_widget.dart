import 'package:bankingapp/app/dashboard/bloc/dashboard_cubit.dart';
import 'package:bankingapp/app/send_money/screen/send_money_screen.dart';
import 'package:bankingapp/core/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMoneyButtonWidget extends StatelessWidget {
  const SendMoneyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.toScreen(const SendMoneyScreen()).then(
        (value) {
          BlocProvider.of<DashboardCubit>(context).initialize();
        },
      ),
      child: const Text('Send Money'),
    );
  }
}
