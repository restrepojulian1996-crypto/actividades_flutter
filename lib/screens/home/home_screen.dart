import 'package:flutter/material.dart';
import '../login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final String userEmail;

  const HomeScreen({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Cerrar sesión',
            onPressed: () => _mostrarDialogoCerrarSesion(context),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _WelcomeCard(userEmail: userEmail),
              const SizedBox(height: 28),
              Text('Acceso rápido', style: theme.textTheme.titleMedium),
              const SizedBox(height: 14),

              // shrinkWrap + NeverScrollableScrollPhysics porque está
              // dentro de un SingleChildScrollView.
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.15,
                children: [
                  _QuickAccessCard(
                    icon: Icons.dashboard_rounded,
                    label: 'Dashboard',
                    color: colors.primary,
                    containerColor: colors.primaryContainer,
                  ),
                  _QuickAccessCard(
                    icon: Icons.notifications_rounded,
                    label: 'Notificaciones',
                    color: const Color(0xFFE65100),
                    containerColor: const Color(0xFFFFF3E0),
                  ),
                  _QuickAccessCard(
                    icon: Icons.settings_rounded,
                    label: 'Configuración',
                    color: const Color(0xFF00695C),
                    containerColor: const Color(0xFFE0F2F1),
                  ),
                  _QuickAccessCard(
                    icon: Icons.help_outline_rounded,
                    label: 'Ayuda',
                    color: colors.secondary,
                    containerColor: colors.secondaryContainer,
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Text('Actividad reciente', style: theme.textTheme.titleMedium),
              const SizedBox(height: 14),
              Column(
                children: const [
                  _ActivityItem(
                    icon: Icons.check_circle_outline,
                    title: 'Sesión iniciada',
                    subtitle: 'Hace un momento',
                    iconColor: Color(0xFF2E7D32),
                  ),
                  _ActivityItem(
                    icon: Icons.info_outline,
                    title: 'Perfil actualizado',
                    subtitle: 'Hace 2 días',
                    iconColor: Color(0xFF1565C0),
                  ),
                  _ActivityItem(
                    icon: Icons.star_outline,
                    title: 'Nuevo logro desbloqueado',
                    subtitle: 'Hace 5 días',
                    iconColor: Color(0xFFF57F17),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDialogoCerrarSesion(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro de que deseas salir?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              // pushAndRemoveUntil borra TODA la pila — el usuario
              // no puede volver al Home después de cerrar sesión.
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: const Text('Salir'),
          ),
        ],
      ),
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  final String userEmail;
  const _WelcomeCard({required this.userEmail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: colors.primaryContainer,
              child: Icon(
                Icons.person_rounded,
                size: 30,
                color: colors.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('¡Hola!', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    userEmail,
                    style: theme.textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAccessCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color containerColor;

  const _QuickAccessCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: containerColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 26, color: color),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const _ActivityItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleSmall),
                Text(subtitle, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            size: 18,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}
