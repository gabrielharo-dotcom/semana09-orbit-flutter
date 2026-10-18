import 'package:flutter/material.dart';
import '../data/demo_data.dart';
import '../theme/app_theme.dart';
import '../widgets/shared.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const campos = <String, IconData>{
      'nombre': Icons.person_outline_rounded,
      'email': Icons.alternate_email_rounded,
      'telefono': Icons.phone_outlined,
      'rol': Icons.verified_user_outlined,
    };
    const etiquetas = {
      'nombre': 'Nombre',
      'email': 'Correo electrónico',
      'telefono': 'Teléfono',
      'rol': 'Rol',
    };
    return Pagina(
      titulo: 'Mi perfil',
      contenido: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: tinta,
              borderRadius: BorderRadius.circular(26),
            ),
            child: Column(
              children: [
                const Etiqueta('MI ESPACIO', oscura: true),
                const SizedBox(height: 24),
                const CircleAvatar(
                  radius: 43,
                  backgroundColor: lima,
                  child: Text(
                    'GH',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: tinta,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  perfil['nombre']!,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  perfil['email']!,
                  style: const TextStyle(
                    color: Color(0xFFCED6EA),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 18),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.verified_rounded, color: lima, size: 16),
                    SizedBox(width: 6),
                    Text(
                      'Administrador',
                      style: TextStyle(color: lima, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Información personal',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 14),
          Card(
            child: Column(
              children: campos.entries
                  .map(
                    (campo) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 6,
                      ),
                      leading: Icon(campo.value, color: azul),
                      title: Text(
                        etiquetas[campo.key]!,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF657089),
                        ),
                      ),
                      subtitle: Text(
                        perfil[campo.key]!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: tinta,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 22),
          OutlinedButton.icon(
            onPressed: () => avisoDemo(
              context,
              'La edición del perfil es solo una demostración visual.',
            ),
            icon: const Icon(Icons.edit_outlined, size: 18),
            label: const Text('Editar perfil'),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'ORBIT / LABORATORIO 09',
              style: TextStyle(fontSize: 10, letterSpacing: 2),
            ),
          ),
        ],
      ),
    );
  }
}
