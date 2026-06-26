import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:fixlora/Screens/login.dart';
import 'package:fixlora/theme/colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {});
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginscr()),
      );
    });
  }

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
              child: Image.asset(
                "assets/images/icon_only.png",
                height: h * 0.01,
                width: w * 0.01,
              ),
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
