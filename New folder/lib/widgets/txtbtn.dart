import 'package:fixlora/theme/colors.dart';
import 'package:flutter/material.dart';

class Txtbtn extends StatelessWidget {
  final String? text;
  final VoidCallback? onPress;
  const Txtbtn({super.key, this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: () {},
      child: Text(
        text ?? "Forgot Password?",
        style: TextStyle(
          color: AppColors.btncolor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
