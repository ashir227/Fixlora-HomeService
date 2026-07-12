import 'package:fixlora/theme/colors.dart';
import 'package:fixlora/widgets/cstmtxt.dart';
import 'package:flutter/material.dart';

class Loginscr extends StatelessWidget {
  const Loginscr({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.1),
              Image.asset(
                "assets/images/smal_log.png",
                height: h * 0.08,
                fit: BoxFit.cover,
              ),
              SizedBox(height: h * 0.06),
              reusetext(
                context: context,
                txt: "Welcome Back",
                clr: AppColors.textPrimary,
                Size: w * 0.08,
                FontWeight: FontWeight.bold,
              ),
              reusetext(
                context: context,
                txt: "Sign in to continue Fixlora",
                clr: AppColors.textDisabled,
                Size: w * 0.04,
                FontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
