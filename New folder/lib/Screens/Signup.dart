import 'package:fixlora/Provider/auth_provider.dart';
// import 'package:fixlora/providers/auth_provider.dart';
import 'package:fixlora/theme/colors.dart';
import 'package:fixlora/widgets/cstm_field.dart';
import 'package:fixlora/widgets/cstmtxt.dart';
import 'package:fixlora/widgets/reuse_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  // ← StatefulWidget
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // ── Controllers yahan — dispose hoga sahi ──
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ── onPressed ka poora logic ───────────────
  void _onSignUp() async {
    // 1. Form validate karo
    if (!_formKey.currentState!.validate()) return;

    // 2. Provider ko call karo
    await context.read<FixAuthProvider>().signUp(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (!mounted) return;

    final auth = context.read<FixAuthProvider>();

    // 3. Result check karo
    if (auth.status == AuthStatus.success) {
      // Home screen par jao
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Error snackbar dikhao
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(auth.errorMessage ?? 'Error'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    // Loading check — sirf button ke liye
    final isLoading =
        context.watch<FixAuthProvider>().status == AuthStatus.loading;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            // ← Form wrap — validation ke liye
            key: _formKey,
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
                  txt: "Join our most trusted platform",
                  clr: AppColors.textHint,
                  Size: w * 0.04,
                  FontWeight: FontWeight.w400,
                ),
                SizedBox(height: h * 0.04),

                // ── Name ──────────────────
                reusetext(
                  context: context,
                  txt: "Full name",
                  clr: AppColors.textHint,
                  Size: w * 0.04,
                  FontWeight: FontWeight.w500,
                ),
                CstmFld(
                  controller: nameController,
                  hintText: "Ali Khan",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty)
                      return "Please enter your name";
                    if (value.trim().length < 3)
                      return "Name must be at least 3 characters";
                    return null;
                  },
                ),
                SizedBox(height: h * 0.03),

                // ── Email ─────────────────
                reusetext(
                  context: context,
                  txt: "Email",
                  clr: AppColors.textHint,
                  Size: w * 0.04,
                  FontWeight: FontWeight.w500,
                ),
                CstmFld(
                  controller: emailController,
                  hintText: "ali@email.com",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty)
                      return "Please enter your email";
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value.trim()))
                      return "Please enter a valid email";
                    return null;
                  },
                ),
                SizedBox(height: h * 0.03),

                // ── Phone ─────────────────
                reusetext(
                  context: context,
                  txt: "Phone",
                  clr: AppColors.textHint,
                  Size: w * 0.04,
                  FontWeight: FontWeight.w500,
                ),
                CstmFld(
                  controller: phoneController,
                  hintText: "03001234567",
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty)
                      return "Please enter your phone number";
                    if (!RegExp(r'^03[0-9]{9}$').hasMatch(value.trim()))
                      return "Enter valid number (03xxxxxxxxx)";
                    return null;
                  },
                ),
                SizedBox(height: h * 0.03),

                // ── Password ──────────────
                reusetext(
                  context: context,
                  txt: "Password",
                  clr: AppColors.textHint,
                  Size: w * 0.04,
                  FontWeight: FontWeight.w500,
                ),
                CstmFld(
                  controller: passwordController,
                  hintText: "••••••••",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Please enter your password";
                    if (value.length < 6)
                      return "Password must be at least 6 characters";
                    return null;
                  },
                ),
                SizedBox(height: h * 0.09),

                // ── Button ────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReUseBtn(
                      text: isLoading ? "Creating..." : "Create account",
                      onPress: isLoading ? null : _onSignUp, // ← yahan logic
                    ),
                  ],
                ),
                SizedBox(height: h * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
