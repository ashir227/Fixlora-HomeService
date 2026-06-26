import 'package:fixlora/theme/colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class SplashScr extends StatelessWidget {
  const SplashScr({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(33),
              ),
              // child: Text("data"),
              width: w * 0.35,
              height: h * 0.18,
            ),
            SizedBox(height: h * 0.03),
            Text(
              "FIXLORA SERICEHUB",
              style: TextStyle(
                color: AppColors.primarySoft,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
