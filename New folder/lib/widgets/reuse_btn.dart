import 'package:fixlora/theme/colors.dart';
import 'package:flutter/material.dart';

class ReUseBtn extends StatelessWidget {
  final String? text;
  final VoidCallback? onPress;

  const ReUseBtn({super.key, this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: h * 0.06,
        width: w * 0.85,
        decoration: BoxDecoration(
          color: AppColors.btnclr2,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.btnclr2.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text ?? "Continue",
          style: TextStyle(
            color: AppColors.textOnPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
