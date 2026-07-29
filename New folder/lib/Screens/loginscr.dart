import 'package:fixlora/theme/colors.dart';
import 'package:fixlora/widgets/cstm_field.dart';
import 'package:fixlora/widgets/cstmtxt.dart';
import 'package:fixlora/widgets/reuse_btn.dart';
import 'package:fixlora/widgets/txtbtn.dart';
import 'package:flutter/material.dart';

class Loginscr extends StatelessWidget {
  const Loginscr({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    TextEditingController mailcntrl = TextEditingController();
    TextEditingController passcntrl = TextEditingController();

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
              SizedBox(height: h * 0.04),
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
              SizedBox(height: h * 0.05),
              Column(
                children: [
                  CstmFld(
                    prefixIcon: Icon(
                      Icons.mail_lock_outlined,
                      color: AppColors.textHint,
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Please enter valid Email";
                      }
                      int? numm = int.tryParse(value);
                      if (numm == null) {
                        return "Please enter valid Email";
                      }
                      if (numm! < 0) {
                        return "Please enter positive value";
                      }
                    },
                    controller: mailcntrl,
                  ),

                  SizedBox(height: h * 0.04),
                  CstmFld(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColors.textHint,
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Please enter valid Email";
                      }
                      int? numm = int.tryParse(value);
                      if (numm == null) {
                        return "Please enter valid Email";
                      }
                      if (numm! < 0) {
                        return "Please enter positive value";
                      }
                    },
                    controller: passcntrl,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Txtbtn()],
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ReUseBtn(),
                  SizedBox(height: h * 0.02),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New here?"),
                      Txtbtn(text: "Create account"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
