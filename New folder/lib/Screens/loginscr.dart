import 'package:fixlora/Provider/auth_provider.dart';
import 'package:fixlora/Screens/Signup.dart';
import 'package:fixlora/theme/colors.dart';
import 'package:fixlora/widgets/cstm_field.dart';
import 'package:fixlora/widgets/cstmtxt.dart';
import 'package:fixlora/widgets/reuse_btn.dart';
import 'package:fixlora/widgets/txtbtn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginscr extends StatefulWidget {
  const Loginscr({super.key});

  @override
  State<Loginscr> createState() => _LoginscrState();
}

class _LoginscrState extends State<Loginscr> {
  // ── Form + Controllers ────────────────────
  final _formKey = GlobalKey<FormState>();
  final mailcntrl = TextEditingController();
  final passcntrl = TextEditingController();

  @override
  void dispose() {
    mailcntrl.dispose();
    passcntrl.dispose();
    super.dispose();
  }

  // ── Login Logic ───────────────────────────
  void _onLogin() async {
    if (!_formKey.currentState!.validate()) return;

    await context.read<FixAuthProvider>().login(
      email: mailcntrl.text.trim(),
      password: passcntrl.text.trim(),
    );

    if (!mounted) return;

    final auth = context.read<FixAuthProvider>();

    if (auth.status == AuthStatus.success) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
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

    final isLoading =
        context.watch<FixAuthProvider>().status == AuthStatus.loading;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
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

              // ── Email ─────────────────────
              CstmFld(
                controller: mailcntrl,
                hintText: "ali@email.com",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(
                  Icons.mail_lock_outlined,
                  color: AppColors.textHint,
                ),
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
              SizedBox(height: h * 0.02),

              // ── Password ──────────────────
              CstmFld(
                controller: passcntrl,
                hintText: "••••••••",
                obscureText: true,
                prefixIcon: Icon(Icons.lock_outline, color: AppColors.textHint),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Please enter your password";
                  if (value.length < 6) return "Min 6 characters";
                  return null;
                },
              ),

              // ── Forgot Password ───────────
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Txtbtn(text: "Forgot password?", onPress: () {})],
              ),
              SizedBox(height: h * 0.02),

              // ── Button + Links ────────────
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ReUseBtn(
                    text: isLoading ? "Signing in..." : "Sign in",
                    onPress: isLoading ? null : _onLogin,
                  ),
                  const Divider(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "New here?",
                        style: TextStyle(color: AppColors.textHint),
                      ),
                      Txtbtn(
                        text: "Create account",
                        onPress: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Signup()),
                        ),
                      ),
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
