import 'package:fixlora/theme/colors.dart';
import 'package:fixlora/widgets/cstm_field.dart';
import 'package:fixlora/widgets/cstmtxt.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namecntrl = TextEditingController();

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.surface,

      body: Padding(
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
              reusetext(
                context: context,
                txt: "join our most trusted platform",
                clr: AppColors.textHint,
                Size: w * 0.04,
                FontWeight: FontWeight.w400,
              ),

              CstmFld(validator: (value) {}, controller: namecntrl),
            ],
          ),
        ),
      ),
    );
  }
}
