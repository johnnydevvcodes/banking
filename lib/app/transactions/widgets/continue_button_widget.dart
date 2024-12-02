import 'package:bankingapp/core/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContinueButtonWidget extends StatelessWidget {
  const ContinueButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () async {
        context.pop();
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
        decoration: const BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: const Text(
          'Continue',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
