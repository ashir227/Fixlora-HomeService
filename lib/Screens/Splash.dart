import 'package:fixlora/theme/colors.dart';
import 'package:flutter/material.dart';

class SplashScr extends StatelessWidget {
  const SplashScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text(
          "FIXLORA",
          style: TextStyle(
            color: AppColors.primarySoft,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
