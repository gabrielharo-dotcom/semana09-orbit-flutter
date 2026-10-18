import 'package:flutter/material.dart';
import '../data/demo_data.dart';
import '../theme/app_theme.dart';
import '../widgets/shared.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String busqueda = '';
  String categoria = 'Todos';
  @override
  Widget build(BuildContext context) {
    // where genera una vista filtrada. toList permite acceder por índice.
    // setState solo actualiza filtros de la interfaz, nunca el catálogo original.
    final visibles = productos
        .where(
          (p) =>
              (p['nombre'] as String).toLowerCase().contains(
                busqueda.toLowerCase().trim(),
              ) &&
              (categoria == 'Todos' || p['categoria'] == categoria),
        )
        .toList();
    return Pagina(
      titulo: 'Productos',
      acciones: [
        IconButton(
          tooltip: 'Registrar producto',
          onPressed: () => Navigator.pushNamed(context, '/registro'),
          icon: const Icon(Icons.add_circle_rounded, color: azul),
        ),
        const SizedBox(width: 12),
      ],
      contenido: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Etiqueta('COLECCIÓN / 01'),
                const SizedBox(height: 14),
                const Encabezado(
                  'Tecnología que inspira',
                  'Una selección para tu próximo gran proyecto.',
                ),
                TextField(
                  key: const Key('buscar'),
                  onChanged: (valor) => setState(() => busqueda = valor),
                  decoration: const InputDecoration(
                    hintText: 'Buscar producto...',
                    prefixIcon: Icon(Icons.search_rounded),
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ['Todos', 'Computación', 'Accesorios']
                        .map(
                          (nombre) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(nombre),
                              selected: categoria == nombre,
                              showCheckmark: false,
                              selectedColor: tinta,
                              labelStyle: TextStyle(
                                color: categoria == nombre
                                    ? Colors.white
                                    : tinta,
                              ),
                              onSelected: (_) =>
                                  setState(() => categoria = nombre),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${visibles.length} ${visibles.length == 1 ? 'producto' : 'productos'}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: tinta,
                      ),
                    ),
                    const Text(
                      'Catálogo de muestra',
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Expanded(
            child: visibles.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off_rounded, size: 46, color: azul),
                        SizedBox(height: 12),
                        Text('No encontramos productos'),
                        Text('Prueba otro nombre o categoría.'),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    itemCount: visibles.length,
                    separatorBuilder: (_, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final p = visibles[index];
                      // Card agrupa visualmente; ListTile ordena imagen, textos y acción.
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: ListTile(
                            leading: Container(
                              width: 66,
                              height: 72,
                              decoration: BoxDecoration(
                                color: p['color'] as Color,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                p['icono'] as IconData,
                                size: 38,
                                color: tinta,
                              ),
                            ),
                            title: Text(
                              p['nombre'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p['categoria'] as String,
                                  style: const TextStyle(fontSize: 11),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'S/ ${(p['precio'] as double).toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: azul,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '${p['stock']} disponibles',
                                  style: const TextStyle(
                                    color: Color(0xFF278B73),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              tooltip: 'Ver ${p['nombre']}',
                              icon: const Icon(Icons.more_horiz_rounded),
                              onPressed: () => showModalBottomSheet<void>(
                                context: context,
                                showDragHandle: true,
                                builder: (context) => SafeArea(
                                  child: Padding(
                                    padding: const EdgeInsets.all(28),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          p['icono'] as IconData,
                                          size: 55,
                                          color: azul,
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          p['nombre'] as String,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.headlineSmall,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          '${p['categoria']} · ${p['stock']} unidades disponibles',
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          'S/ ${(p['precio'] as double).toStringAsFixed(2)}',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleLarge,
                                        ),
                                        const SizedBox(height: 20),
                                        FilledButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text(
                                            'Volver al catálogo',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
