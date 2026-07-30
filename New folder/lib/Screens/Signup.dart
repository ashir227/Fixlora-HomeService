import 'package:fixlora/theme/colors.dart';
import 'package:fixlora/widgets/cstmtxt.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Column(
            children: [
              reusetext(
                context: context,
                txt: "Create account",
                clr: AppColors.textPrimary,
                Size: w * 0.08,
                FontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
