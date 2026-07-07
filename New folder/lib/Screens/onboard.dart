import 'package:fixlora/Screens/loginscr.dart';
import 'package:fixlora/theme/colors.dart';
import 'package:fixlora/widgets/reuse_btn.dart';
import 'package:flutter/material.dart';

class OnBoardscr extends StatelessWidget {
  const OnBoardscr({super.key});
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.surface,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 14, right: 14),
          child: Container(
            child: Column(
              children: [
                Container(
                  // color: AppColors.error,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  clipBehavior: Clip.hardEdge,

                  child: Image.asset("assets/images/Plumber.png"),
                ),
                SizedBox(height: h * 0.1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Find Trusted Home Service Experts",
                      style: TextStyle(
                        fontSize: w * 0.08,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: h * 0.02),
                    Text(
                      "Book verified electricians, plumbers, cleaners, painters, AC technicians, and more—all from one trusted platform.",

                      style: TextStyle(fontSize: w * 0.045),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.21),
                ReUseBtn(
                  text: "Continue",
                  onPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Loginscr()),
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
