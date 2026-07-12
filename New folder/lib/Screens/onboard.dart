import 'package:fixlora/Screens/loginscr.dart';
import 'package:fixlora/theme/colors.dart';
import 'package:fixlora/widgets/reuse_btn.dart';
import 'package:flutter/material.dart';

class OnBoardscr extends StatelessWidget {
  const OnBoardscr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final h = constraints.maxHeight;
            final w = constraints.maxWidth;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: h),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      SizedBox(height: h * 0.03),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: AspectRatio(
                          aspectRatio: 1.1,
                          child: Image.asset(
                            "assets/images/Plumber.png",
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.05),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Find Trusted Home Service Experts",
                            style: TextStyle(
                              fontSize: w * 0.075,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: h * 0.015),
                          Text(
                            "Book verified electricians, plumbers, cleaners, painters, AC technicians, and more—all from one trusted platform.",
                            style: TextStyle(fontSize: w * 0.04),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(height: h * 0.03),
                      ReUseBtn(
                        text: "Continue",
                        onPress: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Loginscr()),
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
