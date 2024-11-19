import 'package:bankingapp/app/send_money/send_money_cubit.dart';
import 'package:bankingapp/core/app_state.dart';
import 'package:bankingapp/core/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final _textEditController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendMoneyCubit, AppState>(
      listener: (context, state) {
        if (state is DataState<bool>) {
          _openSheet(isMoneySent: state.value);
        }
        if (state is ErrorState<String>) {
          _openSheet(isMoneySent: false, message: state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Send Money'),
            ),
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
                  child: Center(
                    child: TextFormField(
                      controller: _textEditController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]')),
                      ],
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          hintText: 'Enter amount',
                          errorStyle: TextStyle(color: Colors.red)),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                CupertinoButton(
                  onPressed: () async {
                    if (state is LoadingState) return;

                    final isValid = _formKey.currentState?.validate() ?? false;
                    if (!isValid) return;

                    await BlocProvider.of<SendMoneyCubit>(context).sendMoney(
                      num.parse(_textEditController.text),
                    );
                  },
                  padding: EdgeInsets.zero,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: MediaQuery.paddingOf(context).bottom,
                    ),
                    width: MediaQuery.sizeOf(context).width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: state is LoadingState
                          ? Colors.grey
                          : Colors.greenAccent,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openSheet({required bool isMoneySent, String? message}) {
    showModalBottomSheet<void>(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .25,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: CupertinoButton(
                        onPressed: context.pop,
                        child: const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            top: 18,
                            bottom: 8,
                          ),
                          child: Icon(Icons.close),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      alignment: Alignment.center,
                      child: Text(
                        isMoneySent
                            ? "Money is successfuly sent! 🎉"
                            : message ?? "Sending money failed. 😔",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
