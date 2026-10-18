import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/shared.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Lista de mapas para construir opciones sin repetir la estructura ListTile.
    final opciones = <Map<String, Object>>[
      {
        'titulo': 'Listar productos',
        'detalle': 'Explora tu colección tecnológica',
        'icono': Icons.grid_view_rounded,
        'ruta': '/productos',
        'color': azul,
      },
      {
        'titulo': 'Registrar producto',
        'detalle': 'Conoce la vista de registro',
        'icono': Icons.add_box_outlined,
        'ruta': '/registro',
        'color': const Color(0xFF9B63CF),
      },
      {
        'titulo': 'Mi perfil',
        'detalle': 'Tu información y espacio personal',
        'icono': Icons.person_outline_rounded,
        'ruta': '/perfil',
        'color': const Color(0xFF278B73),
      },
    ];
    return Pagina(
      titulo: 'Panel principal',
      acciones: [
        IconButton(
          tooltip: 'Ver perfil',
          onPressed: () => Navigator.pushNamed(context, '/perfil'),
          icon: const CircleAvatar(
            backgroundColor: tinta,
            radius: 17,
            child: Text(
              'GH',
              style: TextStyle(fontSize: 11, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 12),
      ],
      contenido: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Marca(),
          const SizedBox(height: 26),
          const Etiqueta('TU ESPACIO DE TRABAJO'),
          const SizedBox(height: 14),
          Text(
            'Hola, Gabriel',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 8),
          const Text('Todo listo para explorar tu catálogo.'),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: tinta,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Etiqueta('COLECCIÓN TECH', oscura: true),
                    Icon(Icons.auto_awesome_rounded, color: lima),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pequeño catálogo.\nGrandes posibilidades.',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: lima,
                    foregroundColor: tinta,
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/productos'),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Explorar productos'),
                      SizedBox(width: 12),
                      Icon(Icons.arrow_forward_rounded, size: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(
                child: _Resumen('04', 'Productos', Icons.inventory_2_outlined),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _Resumen('02', 'Categorías', Icons.category_outlined),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Text(
            '¿Qué hacemos hoy?',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 14),
          ...opciones.map(
            (opcion) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: (opcion['color'] as Color).withValues(alpha: .1),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Icon(
                      opcion['icono'] as IconData,
                      color: opcion['color'] as Color,
                    ),
                  ),
                  title: Text(
                    opcion['titulo'] as String,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    opcion['detalle'] as String,
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () =>
                      Navigator.pushNamed(context, opcion['ruta'] as String),
                ),
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () =>
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
            icon: const Icon(Icons.logout_rounded, size: 18),
            label: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );
  }
}

class _Resumen extends StatelessWidget {
  const _Resumen(this.valor, this.titulo, this.icono);
  final String valor;
  final String titulo;
  final IconData icono;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Icon(icono, color: azul, size: 23),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(valor, style: Theme.of(context).textTheme.headlineSmall),
                Text(titulo, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
