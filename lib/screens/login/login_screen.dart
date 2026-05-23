import 'package:shared_preferences/shared_preferences.dart';
import '../register/register_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    // SIEMPRE limpiar los controladores al destruir el widget.
    // Sin esto hay un memory leak.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    final prefs = await SharedPreferences.getInstance();

    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    if (_emailController.text.trim() == savedEmail &&
        _passwordController.text.trim() == savedPassword) {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(
            userEmail: _emailController.text.trim(),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Correo o contraseña incorrectos',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(theme, colors),
                  const SizedBox(height: 40),
                  _buildFormFields(),
                  const SizedBox(height: 8),
                  _buildForgotPassword(),
                  const SizedBox(height: 24),
                  _buildLoginButton(colors),
                  const SizedBox(height: 20),
                  _buildDivider(theme),
                  const SizedBox(height: 20),
                  _buildRegisterButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, ColorScheme colors) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: colors.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.lock_rounded,
            size: 40,
            color: colors.onPrimaryContainer,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Bienvenido',
          style: theme.textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Inicia sesión para continuar',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        CustomTextField(
          controller: _emailController,
          label: 'Correo electrónico',
          hint: 'usuario@correo.com',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.trim().isEmpty)
              return 'El correo es requerido';
            final emailRegex = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$');
            if (!emailRegex.hasMatch(value.trim())) {
              return 'Ingresa un correo válido (ej: nombre@correo.com)';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _passwordController,
          label: 'Contraseña',
          hint: 'Mínimo 8 caracteres',
          prefixIcon: Icons.lock_outline,
          obscureText: true,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: _login,
          validator: (value) {
            if (value == null || value.isEmpty)
              return 'La contraseña es requerida';
            if (value.length < 8)
              return 'La contraseña debe tener al menos 8 caracteres';
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildLoginButton(ColorScheme colors) {
    return ElevatedButton(
      onPressed: _isLoading ? null : _login,
      child: _isLoading
          ? SizedBox(
              height: 22,
              width: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: colors.onPrimary,
              ),
            )
          : const Text('Iniciar sesión'),
    );
  }

  Widget _buildDivider(ThemeData theme) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('o', style: theme.textTheme.bodySmall),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return OutlinedButton(
      onPressed: _isLoading
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ),
              );
            },
      child: const Text('Crear una cuenta'),
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: _isLoading ? null : () {},
        child: const Text('¿Olvidaste tu contraseña?'),
      ),
    );
  }
}
