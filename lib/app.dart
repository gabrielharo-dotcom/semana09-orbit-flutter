import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/products_screen.dart';
import 'screens/register_screen.dart';
import 'screens/profile_screen.dart';
import 'theme/app_theme.dart';

class OrbitApp extends StatelessWidget {
  const OrbitApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Orbit | Gabriel Haro',
    debugShowCheckedModeBanner: false,
    theme: crearTema(),
    initialRoute: '/',
    // Mapa de rutas: relaciona nombres con los constructores de cada pantalla.
    routes: {
      '/': (_) => const LoginScreen(),
      '/menu': (_) => const MenuScreen(),
      '/productos': (_) => const ProductsScreen(),
      '/registro': (_) => const RegisterScreen(),
      '/perfil': (_) => const ProfileScreen(),
    },
  );
}
