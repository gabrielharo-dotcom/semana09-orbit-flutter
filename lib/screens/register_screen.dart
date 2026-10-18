import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/shared.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) => Pagina(
    titulo: 'Registrar producto',
    contenido: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Etiqueta('DALE ESPACIO A UNA NUEVA IDEA'),
        const SizedBox(height: 14),
        const Encabezado(
          'Un nuevo protagonista',
          'Así se vería el ingreso de un producto al catálogo.',
        ),
        Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: () => avisoDemo(
              context,
              'La selección de imágenes es una vista de demostración.',
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 42,
                      color: azul,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Añade una imagen',
                    style: TextStyle(fontWeight: FontWeight.w700, color: tinta),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Vista previa del producto',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Información del producto',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 14),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Nombre del producto',
            hintText: 'Ej. Laptop Pro 14',
            prefixIcon: Icon(Icons.inventory_2_outlined),
          ),
        ),
        const SizedBox(height: 14),
        const TextField(
          maxLines: 3,
          decoration: InputDecoration(
            labelText: 'Descripción',
            alignLabelWithHint: true,
            hintText: 'Describe sus características principales',
          ),
        ),
        const SizedBox(height: 14),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Precio',
                  prefixText: 'S/ ',
                ),
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Stock',
                  suffixText: 'und.',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        // No hay controladores, peticiones HTTP ni inserciones: el botón es visual.
        FilledButton.icon(
          onPressed: () => avisoDemo(
            context,
            'Prototipo: el producto no se registra ni se almacena.',
          ),
          icon: const Icon(Icons.check_circle_outline_rounded, size: 20),
          label: const Text('Guardar producto'),
        ),
        const SizedBox(height: 12),
        const Center(
          child: Text(
            'Formulario de práctica · Sin almacenamiento',
            style: TextStyle(fontSize: 11),
          ),
        ),
      ],
    ),
  );
}
