import 'package:fixlora/Screens/onboard.dart';
import 'package:fixlora/theme/colors.dart';
import 'package:flutter/material.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginscr()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: w * 0.40,
              height: h * 0.23,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                // color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(33),
              ),
              child: Image.asset(
                "assets/images/icons.png",
                height: h * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: h * 0.03),
            Text(
              "FIXLORA",
              style: TextStyle(
                // color: AppColors.primarySoft,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "SERVICE HUB",
              style: TextStyle(
                // color: AppColors.primarySoft,
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
