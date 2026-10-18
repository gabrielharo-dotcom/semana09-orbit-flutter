import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

void avisoDemo(
  BuildContext context, [
  String mensaje = 'Vista de demostración: no se guardan cambios.',
]) {
  // ScaffoldMessenger presenta información sin crear registros ni cambiar datos.
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(mensaje), behavior: SnackBarBehavior.floating),
  );
}

class Marca extends StatelessWidget {
  const Marca({super.key, this.clara = false});
  final bool clara;
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: clara ? lima : azul,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Icon(
          Icons.all_inclusive_rounded,
          color: clara ? tinta : Colors.white,
          size: 25,
        ),
      ),
      const SizedBox(width: 10),
      Text(
        'orbit',
        style: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.w800,
          letterSpacing: -1,
          color: clara ? Colors.white : tinta,
        ),
      ),
    ],
  );
}

class Etiqueta extends StatelessWidget {
  const Etiqueta(this.texto, {super.key, this.oscura = false});
  final String texto;
  final bool oscura;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
    decoration: BoxDecoration(
      color: oscura ? Colors.white12 : const Color(0xFFEEF2FF),
      borderRadius: BorderRadius.circular(9),
    ),
    child: Text(
      texto,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1,
        color: oscura ? lima : azul,
      ),
    ),
  );
}

class Pagina extends StatelessWidget {
  const Pagina({
    super.key,
    required this.titulo,
    required this.contenido,
    this.acciones,
  });
  final String titulo;
  final Widget contenido;
  final List<Widget>? acciones;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        titulo,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
      actions: acciones,
    ),
    // El ancho máximo mantiene legible el contenido al ejecutar Flutter en web.
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: contenido,
        ),
      ),
    ),
  );
}

class Encabezado extends StatelessWidget {
  const Encabezado(this.titulo, this.descripcion, {super.key});
  final String titulo;
  final String descripcion;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(titulo, style: Theme.of(context).textTheme.headlineSmall),
      const SizedBox(height: 6),
      Text(descripcion),
      const SizedBox(height: 24),
    ],
  );
}
