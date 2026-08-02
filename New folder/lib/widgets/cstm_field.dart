import 'package:fixlora/theme/colors.dart';
import 'package:flutter/material.dart';

class CstmFld extends StatefulWidget {
  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CstmFld({
    super.key,
    this.validator,
    this.controller,
    this.prefixIcon,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  State<CstmFld> createState() => _CstmFldState();
}

class _CstmFldState extends State<CstmFld> {
  bool _isHidden = true; // ← toggle state

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColors.textPrimary),
      keyboardType: widget.keyboardType ?? TextInputType.text,
      controller: widget.controller,
      validator: widget.validator,

      // ← obscureText widget se aayega + toggle se
      obscureText: widget.obscureText ? _isHidden : false,

      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.textHint, fontSize: 14),
        prefixIcon: widget.prefixIcon,

        // ← sirf password field mein icon dikhao
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() => _isHidden = !_isHidden);
                },
                icon: Icon(
                  _isHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.textHint,
                  size: 20,
                ),
              )
            : null,

        fillColor: AppColors.inputBg,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.border, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),
    );
  }
}
