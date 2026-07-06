import 'package:fixlora/theme/colors.dart';
import 'package:flutter/material.dart';

class ReUsebtn extends StatelessWidget {
  const ReUsebtn({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.06,
      width: w * 0.85,
      decoration: BoxDecoration(boxShadow: [], color: AppColors.success),
    );
  }
}
