import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmButtonWidget extends StatelessWidget {
  final Function onPressed;
  final bool isLoading;

  const ConfirmButtonWidget({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () async {
        onPressed.call();
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
          color: isLoading ? Colors.grey : Colors.greenAccent,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: const Text(
          'Confirm',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
