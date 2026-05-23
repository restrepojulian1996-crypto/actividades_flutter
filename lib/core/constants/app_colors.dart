import 'package:flutter/material.dart';

/// Paleta de colores centralizada de la aplicación.
///
/// Principios de esta paleta:
/// - [primary] es el color principal de la marca. Aparece en botones,
///   AppBar y elementos de acción principal.
/// - [secondary] complementa al primario. Se usa en elementos de apoyo
///   como badges, chips o íconos secundarios.
/// - [background] y [surface] son los fondos de pantalla y tarjetas.
/// - [error] siempre debe tener alto contraste con el blanco para
///   ser legible en mensajes de error.
/// - Los colores "On" (onPrimary, onSurface...) son los colores del
///   texto o íconos que van ENCIMA de cada color base.
abstract class AppColors {
  // ─── Colores primarios ─────────────────────────────────────────────────────

  /// Color principal de la marca. Índigo profundo.
  /// Uso: botones de acción principal, AppBar, FAB, indicadores activos.
  static const Color primary = Colors.red;

  /// Variante más clara del primario para contenedores y fondos tintados.
  /// Uso: fondo de chips seleccionados, fondo de avatares, highlights.
  static const Color primaryContainer = Color(0xFFDBE2F9);

  /// Color del texto/ícono que va SOBRE [primary].
  /// Siempre debe tener contraste suficiente (relación 4.5:1 mínimo WCAG AA).
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Color del texto/ícono que va SOBRE [primaryContainer].
  static const Color onPrimaryContainer = Color(0xFF1A237E);

  // ─── Colores secundarios ───────────────────────────────────────────────────

  /// Color secundario de apoyo. Azul grisáceo.
  /// Uso: elementos flotantes, acciones secundarias, íconos de estado.
  static const Color secondary = Color(0xFF7091E6);

  /// Variante contenedor del secundario.
  static const Color secondaryContainer = Color(0xFFE8EDFF);

  /// Color del texto/ícono sobre [secondary].
  static const Color onSecondary = Color(0xFFFFFFFF);

  // ─── Colores de superficie ─────────────────────────────────────────────────

  /// Fondo general de las pantallas.
  /// Uso: Scaffold background. Tono muy claro, casi blanco.
  static const Color background = Color(0xFFF8F9FE);

  /// Superficie de tarjetas, modales y componentes elevados.
  /// Ligeramente más oscuro que [background] para crear profundidad.
  static const Color surface = Color(0xFFFFFFFF);

  /// Variante de superficie con tinte del color primario.
  /// Uso: DrawerHeader, encabezados de sección con jerarquía visual.
  static const Color surfaceVariant = Color(0xFFEEF2FF);

  /// Color del texto principal sobre [surface] y [background].
  static const Color onSurface = Color(0xFF1C1B1F);

  /// Color del texto secundario / labels sobre superficies.
  /// Más suave que [onSurface], para información de apoyo.
  static const Color onSurfaceVariant = Color(0xFF49454F);

  // ─── Colores de estado ─────────────────────────────────────────────────────

  /// Color de error. Rojo estándar Material.
  /// Uso: mensajes de error, bordes de campos inválidos, iconos de alerta.
  static const Color error = Color(0xFFBA1A1A);

  /// Fondo de contenedores de error (más claro y suave).
  static const Color errorContainer = Color(0xFFFFDAD6);

  /// Color del texto/ícono sobre [error].
  static const Color onError = Color(0xFFFFFFFF);

  /// Color de éxito. No es parte del sistema Material estándar,
  /// pero es útil para validaciones y confirmaciones.
  static const Color success = Color(0xFF2E7D32);

  /// Fondo suave para mensajes de éxito.
  static const Color successContainer = Color(0xFFE8F5E9);

  // ─── Colores neutros ───────────────────────────────────────────────────────

  /// Color de bordes, divisores y elementos de outline.
  static const Color outline = Color(0xFFCAC4D0);

  /// Variante más suave del outline para divisores sutiles.
  static const Color outlineVariant = Color(0xFFE7E0EC);

  /// Texto con énfasis reducido: subtítulos, hints, metadatos.
  static const Color textMuted = Color(0xFF79747E);

  // ─── Tema oscuro ──────────────────────────────────────────────────────────

  /// Primario para tema oscuro (más claro para que contraste con el fondo oscuro).
  static const Color primaryDark = Color(0xFF7091E6);

  /// Fondo de pantalla en tema oscuro.
  static const Color backgroundDark = Color(0xFF141218);

  /// Superficie de tarjetas en tema oscuro.
  static const Color surfaceDark = Color(0xFF211F26);
}
