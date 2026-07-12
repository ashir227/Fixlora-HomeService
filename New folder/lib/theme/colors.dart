import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Primary ──────────────────────────────
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryLight = Color(0xFF3B82F6);
  static const Color primaryDark = Color(0xFF1D4ED8);
  static const Color primarySoft = Color(0xFFEFF6FF);
  static const Color primaryBorder = Color(0xFFDBEAFE);

  // ── Background ───────────────────────────
  static const Color background = Color(0xFFF8FAFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color inputBg = Color(0xFFF0F4FF);

  // ── Text ─────────────────────────────────
  static const Color textPrimary = Color(0xFF0F1825);
  static const Color textSecondary = Color(0xFF555555);
  static const Color textHint = Color(0xFF888888);
  static const Color textDisabled = Color(0xFFBBBBBB);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color fieldfill = Color(0xFFF3F4F6);

  // ── Border ───────────────────────────────
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderFocus = Color(0xFF2563EB);

  // ── Status ───────────────────────────────
  static const Color btnclr2 = Color(0xFF16A10A);
  static const Color btncolor = Color(0xFF22c55e);
  static const Color successLight = Color(0xFFDCFCE7);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFFF9C4);
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color info = Color(0xFF0284C7);
  static const Color infoLight = Color(0xFFE0F2FE);

  // ── Gradients ────────────────────────────
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
  );

  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E3A5F), Color(0xFF0F1825)],
  );
}
