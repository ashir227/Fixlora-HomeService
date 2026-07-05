import 'package:fixlora/theme/colors.dart';
import 'package:flutter/material.dart';

class loginscr extends StatelessWidget {
  const loginscr({super.key});
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.surface,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Column(
              children: [
                Image.asset("assets/images/Plumber.png"),
                SizedBox(height: h * 0.1),
                Padding(
                  padding: const EdgeInsets.only(right: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Find Trusted Home Service Experts")],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
