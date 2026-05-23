import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Sistema tipográfico centralizado de la aplicación.
///
/// Estructura de jerarquía visual:
/// - [displayLarge / displayMedium] → Titulares de pantalla completa, cifras grandes
/// - [headlineLarge / headlineMedium / headlineSmall] → Encabezados de sección
/// - [titleLarge / titleMedium / titleSmall] → Títulos de tarjetas y listas
/// - [bodyLarge / bodyMedium / bodySmall] → Texto de contenido principal
/// - [labelLarge / labelMedium / labelSmall] → Etiquetas de botones y chips
///
/// Fuentes usadas:
/// - [Sora] para títulos: geométrica, moderna, con carácter propio
/// - [Inter] para cuerpo: altamente legible en pantallas pequeñas
abstract class AppTextStyles {
  // ─── Fuentes base ──────────────────────────────────────────────────────────

  static TextStyle get _titleBase => GoogleFonts.sora(
        color: AppColors.onSurface,
        letterSpacing: -0.5,
      );

  static TextStyle get _bodyBase => GoogleFonts.inter(
        color: AppColors.onSurface,
      );

  // ─── Displayes ────────────────────────────────────────────────────────────

  static TextStyle get displayLarge => _titleBase.copyWith(
        fontSize: 57,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      );

  static TextStyle get displayMedium => _titleBase.copyWith(
        fontSize: 45,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      );

  // ─── Encabezados ──────────────────────────────────────────────────────────

  static TextStyle get headlineLarge => _titleBase.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
      );

  static TextStyle get headlineMedium => _titleBase.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get headlineSmall => _titleBase.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  // ─── Títulos ──────────────────────────────────────────────────────────────

  static TextStyle get titleLarge => _titleBase.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMedium => _titleBase.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
      );

  static TextStyle get titleSmall => _titleBase.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      );

  // ─── Cuerpo de texto ──────────────────────────────────────────────────────

  static TextStyle get bodyLarge => _bodyBase.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle get bodyMedium => _bodyBase.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.43,
      );

  static TextStyle get bodySmall => _bodyBase.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.33,
      );

  // ─── Etiquetas ────────────────────────────────────────────────────────────

  static TextStyle get labelLarge => _bodyBase.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
      );

  static TextStyle get labelMedium => _bodyBase.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      );

  static TextStyle get labelSmall => _bodyBase.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: AppColors.textMuted,
      );

  // ─── Estilos específicos de componentes ──────────────────────────────────

  static TextStyle get inputText => _bodyBase.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface,
      );

  static TextStyle get inputLabel => _bodyBase.copyWith(
        fontSize: 14,
        color: AppColors.textMuted,
      );

  static TextStyle get buttonPrimary => _bodyBase.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        color: AppColors.onPrimary,
      );
}
