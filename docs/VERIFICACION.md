# Verificación del laboratorio

Autor: Gabriel Haro
Fecha: 17 de octubre de 2026

| Comando | Resultado |
| --- | --- |
| `flutter analyze` | Sin incidencias |
| `flutter test` | 9 pruebas correctas |
| `flutter build web --release` | Compilación web generada |

Las pruebas recorren acceso, menú, catálogo, registro, perfil, retorno y cierre de sesión; verifican filtros, búsquedas sin resultados y avisos; comparan siete capturas; y comprueban la ausencia de desbordamientos a 320 × 640 y 1440 × 900.

La compilación Android no se ejecutó. El proyecto incluye la plataforma Android generada por Flutter.
