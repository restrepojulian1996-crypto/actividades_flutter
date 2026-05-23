import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      debugShowCheckedModeBanner: false,

      // Tema claro: se aplica cuando el sistema está en modo día.
      theme: AppTheme.light,

      // Tema oscuro: se aplica cuando el sistema está en modo noche.
      darkTheme: AppTheme.dark,

      // ThemeMode.system: Flutter detecta automáticamente la preferencia
      // del usuario y aplica el tema correspondiente.
      themeMode: ThemeMode.dark,

      home: const LoginScreen(),
    );
  }
}
