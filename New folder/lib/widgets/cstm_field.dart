import 'package:fixlora/theme/colors.dart';
import 'package:flutter/material.dart';

class CstmFld extends StatelessWidget {
  // final Function(String) onChanged;
  final FormFieldValidator validator;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  // KeyboardListener key
  const CstmFld({
    super.key,
    // required this.onChanged,
    required this.validator,
    required this.controller,
    this.prefixIcon,
     this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColors.primarySoft),
      keyboardType: TextInputType.number,
      controller: controller,
      // onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,

        fillColor: AppColors.fieldfill,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0.5,
            color: AppColors.textDisabled.withOpacity(0.6),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.textDisabled.withOpacity(0.6),
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
