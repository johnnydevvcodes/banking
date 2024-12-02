import 'package:bankingapp/app/transactions/bloc/transactions_cubit.dart';
import 'package:bankingapp/app/transactions/widgets/continue_button_widget.dart';
import 'package:bankingapp/core/app_state.dart';
import 'package:bankingapp/core/transaction_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TransactionsCubit>(context).getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsCubit, AppState>(
      builder: (BuildContext context, state) {
        final isLoading = state is LoadingState;
        final isDataState = state is DataState<List<TransactionEntity>>;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Transactions'),
          ),
          body: Column(
            children: [
              if (isLoading)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
              if (isDataState)
                Expanded(
                  child: state.value.isEmpty
                      ? const Center(
                          child: Text(
                            'Oops. Such empty!\nKindly send money to see your transactions.',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: state.value.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final transaction = state.value[index];

                            return Container(
                              color: Colors.grey,
                              margin: const EdgeInsets.only(bottom: 3),
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(Icons.monetization_on),
                                  ),
                                  const Gap(12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          transaction.amount.toStringAsFixed(2),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Money Sent',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Gap(12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        DateFormat('MMM d, ').add_jm().format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                transaction.created)),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        'Posted Date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
                const ContinueButtonWidget(),
            ],
          ),
        );
      },
    );
  }
}
