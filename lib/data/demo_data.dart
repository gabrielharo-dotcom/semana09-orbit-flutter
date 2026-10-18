import 'package:flutter/material.dart';

// Una List contiene Mapas: cada mapa agrupa los atributos de un producto.
// Son datos constantes de demostración; no se consulta ninguna base de datos.
const List<Map<String, Object>> productos = [
  {
    'nombre': 'Laptop Pro 14',
    'categoria': 'Computación',
    'precio': 3500.0,
    'stock': 10,
    'icono': Icons.laptop_mac_rounded,
    'color': Color(0xFFE9EEFF),
  },
  {
    'nombre': 'Mouse inalámbrico',
    'categoria': 'Accesorios',
    'precio': 50.0,
    'stock': 25,
    'icono': Icons.mouse_rounded,
    'color': Color(0xFFF0EAFE),
  },
  {
    'nombre': 'Teclado mecánico',
    'categoria': 'Accesorios',
    'precio': 120.0,
    'stock': 15,
    'icono': Icons.keyboard_rounded,
    'color': Color(0xFFFFEFE3),
  },
  {
    'nombre': 'Monitor Studio 27',
    'categoria': 'Computación',
    'precio': 800.0,
    'stock': 8,
    'icono': Icons.desktop_windows_rounded,
    'color': Color(0xFFE1F3ED),
  },
];

const Map<String, String> perfil = {
  'nombre': 'Gabriel Haro',
  'email': 'gabriel.haro@tecsup.edu.pe',
  'telefono': 'Sin especificar',
  'rol': 'Administrador',
};
