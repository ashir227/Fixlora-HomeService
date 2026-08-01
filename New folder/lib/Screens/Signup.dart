import 'package:fixlora/theme/colors.dart';
import 'package:fixlora/widgets/cstm_field.dart';
import 'package:fixlora/widgets/cstmtxt.dart';
import 'package:fixlora/widgets/reuse_btn.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.surface,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.06),
                reusetext(
                  context: context,
                  txt: "Create account",

                  clr: AppColors.textPrimary,
                  Size: w * 0.08,
                  FontWeight: FontWeight.bold,
                ),
                SizedBox(height: h * 0.01),
                reusetext(
                  context: context,
                  txt: "join our most trusted platform",
                  clr: AppColors.textHint,
                  Size: w * 0.04,
                  FontWeight: FontWeight.w400,
                ),
                SizedBox(height: h * 0.04),
                reusetext(
                  context: context,
                  txt: "Full name",
                  clr: AppColors.textHint,
                  Size: w * 0.04,
                  FontWeight: FontWeight.w500,
                ),

                CstmFld(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your name";
                    }

                    if (value.trim().length < 3) {
                      return "Name must be at least 3 characters";
                    }

                    return null;
                  },
                  controller: nameController,
                ),
                SizedBox(height: h * 0.03),
                reusetext(
                  context: context,
                  txt: "Email",
                  clr: AppColors.textHint,
                  Size: w * 0.04,
                  FontWeight: FontWeight.w500,
                ),

                CstmFld(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your email";
                    }

                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value.trim())) {
                      return "Please enter a valid email";
                    }

                    return null;
                  },
                  controller: emailController,
                ),
                SizedBox(height: h * 0.03),
                reusetext(
                  context: context,
                  txt: "Phone",
                  clr: AppColors.textHint,
                  Size: w * 0.04,
                  FontWeight: FontWeight.w500,
                ),

                CstmFld(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your phone number";
                    }

                    if (!RegExp(r'^03[0-9]{9}$').hasMatch(value.trim())) {
                      return "Enter a valid phone number";
                    }

                    return null;
                  },
                  controller: phoneController,
                ),
                SizedBox(height: h * 0.03),
                reusetext(
                  context: context,
                  txt: "Password",
                  clr: AppColors.textHint,
                  Size: w * 0.04,
                  FontWeight: FontWeight.w500,
                ),

                CstmFld(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }

                    if (value.length < 6) {
                      return "Password must be at least 8 characters";
                    }

                    return null;
                  },
                  controller: passwordController,
                ),
                SizedBox(height: h * 0.09),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ReUseBtn(text: "Create account")],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
