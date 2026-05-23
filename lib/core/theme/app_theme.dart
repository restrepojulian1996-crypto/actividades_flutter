import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

/// Clase que centraliza el [ThemeData] de la aplicación.
///
/// Expone dos temas:
/// - [light] → tema claro (modo día)
/// - [dark]  → tema oscuro (modo noche)
abstract class AppTheme {
  // ─── Tema claro ───────────────────────────────────────────────────────────

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          primaryContainer: AppColors.primaryContainer,
          onPrimaryContainer: AppColors.onPrimaryContainer,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          secondaryContainer: AppColors.secondaryContainer,
          onSecondaryContainer: AppColors.onPrimaryContainer,
          error: AppColors.error,
          onError: AppColors.onError,
          errorContainer: AppColors.errorContainer,
          onErrorContainer: AppColors.error,
          surface: AppColors.surface,
          onSurface: AppColors.onSurface,
          surfaceContainerHighest: AppColors.surfaceVariant,
          onSurfaceVariant: AppColors.onSurfaceVariant,
          outline: AppColors.outline,
          outlineVariant: AppColors.outlineVariant,
          shadow: Colors.black,
          scrim: Colors.black,
          inverseSurface: AppColors.onSurface,
          onInverseSurface: AppColors.surface,
          inversePrimary: AppColors.primaryDark,
        ),
        scaffoldBackgroundColor: AppColors.background,
        textTheme: TextTheme(
          displayLarge: AppTextStyles.displayLarge,
          displayMedium: AppTextStyles.displayMedium,
          headlineLarge: AppTextStyles.headlineLarge,
          headlineMedium: AppTextStyles.headlineMedium,
          headlineSmall: AppTextStyles.headlineSmall,
          titleLarge: AppTextStyles.titleLarge,
          titleMedium: AppTextStyles.titleMedium,
          titleSmall: AppTextStyles.titleSmall,
          bodyLarge: AppTextStyles.bodyLarge,
          bodyMedium: AppTextStyles.bodyMedium,
          bodySmall: AppTextStyles.bodySmall,
          labelLarge: AppTextStyles.labelLarge,
          labelMedium: AppTextStyles.labelMedium,
          labelSmall: AppTextStyles.labelSmall,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 1,
          centerTitle: true,
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.onSurface,
          titleTextStyle: AppTextStyles.titleLarge.copyWith(
            color: AppColors.onSurface,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.onPrimary,
            minimumSize: const Size.fromHeight(52),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: AppTextStyles.labelLarge,
            elevation: 0,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            minimumSize: const Size.fromHeight(52),
            side: const BorderSide(color: AppColors.outline, width: 1.5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            textStyle: AppTextStyles.labelLarge,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.outline, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.outline, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.error, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.error, width: 2),
          ),
          labelStyle: AppTextStyles.inputLabel,
          hintStyle:
              AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted),
          errorStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.error),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          prefixIconColor: AppColors.textMuted,
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          color: AppColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.outlineVariant, width: 1),
          ),
          margin: EdgeInsets.zero,
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: AppColors.onSurface,
          contentTextStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.surface,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
        ),
      );

  // ─── Tema oscuro ──────────────────────────────────────────────────────────

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.primaryDark,
          onPrimary: AppColors.backgroundDark,
          primaryContainer: const Color(0xFF2A3A6E),
          onPrimaryContainer: AppColors.primaryContainer,
          secondary: AppColors.secondary,
          onSecondary: AppColors.backgroundDark,
          secondaryContainer: const Color(0xFF2D3E6B),
          onSecondaryContainer: AppColors.secondaryContainer,
          error: const Color(0xFFFFB4AB),
          onError: const Color(0xFF690005),
          errorContainer: const Color(0xFF93000A),
          onErrorContainer: const Color(0xFFFFDAD6),
          surface: AppColors.surfaceDark,
          onSurface: const Color(0xFFE6E1E5),
          surfaceContainerHighest: const Color(0xFF302D38),
          onSurfaceVariant: const Color(0xFFCAC4D0),
          outline: const Color(0xFF938F99),
          outlineVariant: const Color(0xFF49454F),
          shadow: Colors.black,
          scrim: Colors.black,
          inverseSurface: const Color(0xFFE6E1E5),
          onInverseSurface: const Color(0xFF313033),
          inversePrimary: AppColors.primary,
        ),
        scaffoldBackgroundColor: AppColors.backgroundDark,
        textTheme: GoogleFonts.soraTextTheme(ThemeData.dark().textTheme),
        // ... (misma estructura que el tema claro adaptada para dark)
      );
}
