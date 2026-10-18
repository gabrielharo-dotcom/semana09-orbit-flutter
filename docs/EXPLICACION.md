# Explicación del laboratorio

**Autor:** Gabriel Haro
**Curso:** Aplicaciones Multiplataformas
**Actividad:** Laboratorio 09 · Sección B

## Objetivo

Desarrollar un prototipo de catálogo en Dart con Flutter, aplicando ListViews, ListTiles, listas y mapas, rutas, tema global y Cards. Las cinco vistas corresponden al esquema proporcionado en la actividad, con una propuesta visual propia llamada Orbit.

## Desarrollo

1. Se creó el proyecto Flutter con soporte para Android y web.
2. Se definieron los datos locales: una lista de cuatro mapas de productos y un mapa del perfil.
3. Se construyó un tema global con azul, azul oscuro y lima, tipografía local y estilos comunes para formularios y botones.
4. Se separó el código en datos, tema, componentes compartidos y pantallas.
5. Se conectaron las cinco pantallas mediante un mapa de rutas en `MaterialApp`.
6. Se añadieron búsqueda, filtros por categoría y una ficha inferior del producto como interacciones de interfaz.
7. Se documentó la lógica complementaria y se prepararon pruebas de navegación y capturas.

## Temas solicitados y aplicación

| Tema | Archivo | Uso |
| --- | --- | --- |
| ListViews | `lib/screens/products_screen.dart` | `ListView.separated` genera filas de productos y separadores según los datos filtrados. |
| ListTiles | Catálogo, menú y perfil | Cada fila ordena icono, título, subtítulo y acción. |
| Listas y mapas | `lib/data/demo_data.dart` | `List<Map<String, Object>>` almacena distintos atributos; el perfil usa `Map<String, String>`. |
| Rutas | `lib/app.dart` | Mapa de nombres: `/`, `/menu`, `/productos`, `/registro` y `/perfil`. |
| Tema global | `lib/theme/app_theme.dart` | `ThemeData` centraliza colores, tipografía, botones, Cards y campos. |
| Cards | Menú, catálogo, registro y perfil | Agrupan contenidos relacionados con esquinas redondeadas y fondo blanco. |

## Código complementario comentado

No se dispone de una lista exacta del código visto en clase. Estos son los recursos adicionales incorporados, explicados aquí y con comentarios en los puntos principales del código:

### Estado local con StatefulWidget y setState

El acceso usa un booleano para mostrar u ocultar la contraseña. El catálogo guarda únicamente el texto de búsqueda y la categoría elegida. `setState` solicita a Flutter volver a dibujar el widget con esos valores. Los productos permanecen constantes.

### where, map, toList y operador spread

`where` selecciona productos que cumplen simultáneamente búsqueda y categoría. `toList` transforma el resultado en una lista que puede recorrerse por índice. `map` convierte las opciones del menú y los datos del perfil en widgets. `...` incorpora los widgets generados a la lista `children`.

### Conversiones de tipos y null safety

Un mapa de productos incluye textos, números, colores e iconos. Por eso utiliza `Object` como tipo de valor y conversiones como `as String` o `as IconData` al leer cada atributo. En el perfil, `!` indica que las claves conocidas de este mapa constante tienen un valor definido.

### Pila de navegación

`pushNamed` abre una pantalla conservando la anterior para volver. `pushReplacementNamed` reemplaza el acceso por el menú. `pushNamedAndRemoveUntil` elimina las vistas anteriores al cerrar sesión, evitando regresar al panel mediante el botón atrás. No representa autenticación real.

### Componentes compartidos

`Pagina` reutiliza la barra superior, `SafeArea` y `ConstrainedBox`. `Marca`, `Etiqueta` y `Encabezado` mantienen una apariencia consistente sin copiar todo el código.

### Diseño adaptable

`SafeArea` respeta las zonas del sistema; `ConstrainedBox` limita el ancho en escritorio. `Expanded` distribuye el espacio disponible. Las vistas largas usan `ListView`; los filtros se pueden desplazar horizontalmente en pantallas estrechas.

### Avisos y ficha de producto

`ScaffoldMessenger` muestra mensajes temporales mediante `SnackBar`. `showModalBottomSheet` presenta detalles locales del producto en un panel inferior; `Navigator.pop` lo cierra. Ninguna de estas acciones escribe datos.

### Tipografía sin conexión

Roboto se incluye como recurso local, con su licencia. No se descarga una fuente durante la ejecución. `FontLoader`, utilizado solo en pruebas, permite que las capturas tengan letras reales en lugar de la fuente de prueba de Flutter.

## Alcance

El botón de ingreso permite entrar sin validar credenciales. El formulario acepta escritura temporal, pero Guardar solo muestra un aviso. No se seleccionan archivos, no se crean productos y no se edita el perfil. No hay servidor, API, base de datos ni almacenamiento persistente. Los datos desaparecen o se reinician al reconstruir la vista según su estado local.

## Guion para presentar

1. Mostrar el acceso y la opción para ver la contraseña; ingresar sin credenciales.
2. Explicar la identidad visual y las tarjetas de resumen del menú.
3. Abrir Productos, buscar “mouse”, borrar la búsqueda y filtrar por categoría.
4. Abrir los tres puntos de un producto para ver su ficha.
5. Entrar al registro con el botón + y mostrar que Guardar solo informa, sin crear un registro.
6. Volver al menú, abrir el perfil y mostrar el aviso de edición.
7. Cerrar sesión y explicar el mapa de rutas, el tema global y los datos locales en Dart.

## Referencias

- [Documentación oficial: rutas con nombre](https://docs.flutter.dev/cookbook/navigation/named-routes). Se utilizan por el alcance didáctico de este laboratorio de cinco pantallas.
- [Documentación oficial: tema global](https://docs.flutter.dev/cookbook/design/themes).
- [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html), [ListTile](https://api.flutter.dev/flutter/material/ListTile-class.html) y [Card](https://api.flutter.dev/flutter/material/Card-class.html).
