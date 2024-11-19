import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isBalanceShown = false;

  @override
  Widget build(BuildContext context) {
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
              color: Colors.black,
              onPressed: () {},
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _isBalanceShown ? '0.00' : '******',
                      style: const TextStyle(
                        color: Colors.white,
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
            ),
          ),
          CupertinoButton(
            onPressed: () {},
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
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Text('Send Money'),
      ),
    );
  }
}
