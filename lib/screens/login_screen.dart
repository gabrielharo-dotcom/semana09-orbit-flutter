import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool ocultar = true;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: ListView(
            padding: const EdgeInsets.all(26),
            children: [
              const SizedBox(height: 12),
              const Marca(),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(26),
                decoration: BoxDecoration(
                  color: tinta,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Etiqueta('TU CATÁLOGO, EN ÓRBITA', oscura: true),
                    const SizedBox(height: 22),
                    const Text(
                      'Grandes ideas.\nTodo en un lugar.',
                      style: TextStyle(
                        fontSize: 32,
                        height: 1.15,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: lima,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.inventory_2_outlined,
                            color: tinta,
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Expanded(
                          child: Text(
                            'Explora, organiza y descubre\ntu espacio de productos.',
                            style: TextStyle(
                              color: Color(0xFFCED6EA),
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Bienvenido de nuevo',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 6),
              const Text('Ingresa y explora tu panel de productos.'),
              const SizedBox(height: 22),
              const TextField(
                key: Key('email'),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  prefixIcon: Icon(Icons.alternate_email_rounded),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                key: const Key('password'),
                obscureText: ocultar,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    tooltip: ocultar
                        ? 'Mostrar contraseña'
                        : 'Ocultar contraseña',
                    onPressed: () => setState(() => ocultar = !ocultar),
                    icon: Icon(
                      ocultar
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => avisoDemo(
                    context,
                    'Acceso de práctica: puedes ingresar sin credenciales.',
                  ),
                  child: const Text('¿Olvidaste tu contraseña?'),
                ),
              ),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/menu'),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ingresar al panel'),
                    SizedBox(width: 12),
                    Icon(Icons.arrow_forward_rounded, size: 19),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'MODO DEMOSTRACIÓN · SIN CREDENCIALES',
                  style: TextStyle(
                    fontSize: 10,
                    letterSpacing: 1.2,
                    color: Color(0xFF657089),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  'Gabriel Haro  /  Aplicaciones Multiplataformas',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
