import 'package:bankingapp/app/dashboard/bloc/dashboard_cubit.dart';
import 'package:bankingapp/app/dashboard/widgets/send_money_button_widget.dart';
import 'package:bankingapp/app/send_money/screen/send_money_screen.dart';
import 'package:bankingapp/app/transactions/screen/transaction_list_screen.dart';
import 'package:bankingapp/core/app_state.dart';
import 'package:bankingapp/core/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isBalanceShown = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardCubit>(context).initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, AppState>(
      builder: (BuildContext context, state) {
        final isLoading = state is LoadingState;
        final isDataState = state is DataState<num>;

        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.paddingOf(context).top,
                  bottom: 16,
                  right: 16,
                  left: 16,
                ),
                height: 200,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  color: Colors.black,
                  onPressed: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Account Balance',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _isBalanceShown || isLoading
                                  ? isDataState
                                      ? 'Php ${state.value.toStringAsFixed(2)}'
                                      : 'Php 0,000.00'
                                  : '******',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(8),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _isBalanceShown = !_isBalanceShown;
                                });
                              },
                              child: _isBalanceShown
                                  ? const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      Icons.remove_red_eye_rounded,
                                      color: Colors.white,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(24),
                    ],
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: () =>
                    context.toScreen(const TransactionListScreen()),
                padding: EdgeInsets.zero,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Transactions  >',
                      style: TextStyle(color: Colors.black),
                    ),
                    Gap(16),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: const SendMoneyButtonWidget(),
        );
      },
    );
  }
}
