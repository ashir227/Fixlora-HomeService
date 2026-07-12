import 'package:fixlora/theme/colors.dart';
import 'package:flutter/material.dart';

class Loginscr extends StatelessWidget {
  const Loginscr({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: h * 0.1),
            Image.asset(
              "assets/images/smal_log.png",
              height: h * 0.08,
              fit: BoxFit.cover,
            ),
            SizedBox(height: h * 0.06),
            Text("Welcome back"),
          ],
        ),
      ),
    );
  }
}
