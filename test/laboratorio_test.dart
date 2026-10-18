import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:orbit_catalogo/app.dart';
import 'package:orbit_catalogo/screens/login_screen.dart';
import 'package:orbit_catalogo/screens/menu_screen.dart';
import 'package:orbit_catalogo/screens/products_screen.dart';
import 'package:orbit_catalogo/screens/register_screen.dart';
import 'package:orbit_catalogo/screens/profile_screen.dart';
import 'package:orbit_catalogo/theme/app_theme.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final fuente = FontLoader('OrbitRoboto')
      ..addFont(rootBundle.load('assets/fonts/roboto-regular.ttf'))
      ..addFont(rootBundle.load('assets/fonts/roboto-bold.ttf'));
    await fuente.load();
    await (FontLoader('Roboto')
          ..addFont(rootBundle.load('assets/fonts/roboto-regular.ttf'))
          ..addFont(rootBundle.load('assets/fonts/roboto-bold.ttf')))
        .load();
    await (FontLoader(
      'MaterialIcons',
    )..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'))).load();
  });
  testWidgets('Ingreso, rutas, retorno y cierre de sesión', (tester) async {
    await tester.binding.setSurfaceSize(const Size(430, 1000));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(const OrbitApp());
    await tester.tap(find.text('Ingresar al panel'));
    await tester.pumpAndSettle();
    expect(find.text('Hola, Gabriel'), findsOneWidget);
    await tester.tap(find.text('Listar productos'));
    await tester.pumpAndSettle();
    expect(find.text('Laptop Pro 14'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Registrar producto'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Guardar producto'));
    await tester.pumpAndSettle();
    expect(
      find.text('Prototipo: el producto no se registra ni se almacena.'),
      findsOneWidget,
    );
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Mi perfil'));
    await tester.pumpAndSettle();
    expect(find.text('Gabriel Haro'), findsNWidgets(2));
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Cerrar sesión'));
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cerrar sesión'));
    await tester.pumpAndSettle();
    expect(find.text('Ingresar al panel'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Búsqueda y categorías filtran los datos de muestra', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(430, 1000));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: crearTema(),
        home: const ProductsScreen(),
      ),
    );
    await tester.tap(find.widgetWithText(ChoiceChip, 'Accesorios'));
    await tester.pumpAndSettle();
    expect(find.text('2 productos'), findsOneWidget);
    expect(find.text('Laptop Pro 14'), findsNothing);
    await tester.enterText(find.byKey(const Key('buscar')), 'no existe');
    await tester.pumpAndSettle();
    expect(find.text('No encontramos productos'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('buscar')), 'mouse');
    await tester.pumpAndSettle();
    expect(find.text('1 producto'), findsOneWidget);
    expect(find.text('Mouse inalámbrico'), findsOneWidget);
  });

  // Capturas reales de widgets Flutter. Para actualizarlas:
  // flutter test --update-goldens
  final pantallas = <String, Widget>{
    '01-login': const LoginScreen(),
    '02-menu': const MenuScreen(),
    '03-productos': const ProductsScreen(),
    '04-registro': const RegisterScreen(),
    '05-perfil': const ProfileScreen(),
  };
  for (final pantalla in pantallas.entries) {
    testWidgets('Captura ${pantalla.key}', (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(430, 1100);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: crearTema(),
          home: RepaintBoundary(
            key: const Key('captura'),
            child: pantalla.value,
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byKey(const Key('captura')),
        matchesGoldenFile('../docs/capturas/${pantalla.key}.png'),
      );
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('Capturas de filtro y aviso de registro', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(430, 1100);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: crearTema(),
        home: const ProductsScreen(),
      ),
    );
    await tester.enterText(find.byKey(const Key('buscar')), 'mouse');
    await tester.pumpAndSettle();
    expect(find.text('1 producto'), findsOneWidget);
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('../docs/capturas/06-busqueda.png'),
    );
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: crearTema(),
        home: const RegisterScreen(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Guardar producto'));
    await tester.pumpAndSettle();
    expect(
      find.text('Prototipo: el producto no se registra ni se almacena.'),
      findsOneWidget,
    );
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('../docs/capturas/07-aviso-registro.png'),
    );
  });

  testWidgets('Pantallas sin desbordamientos en móvil pequeño y escritorio', (
    tester,
  ) async {
    addTearDown(() => tester.binding.setSurfaceSize(null));
    for (final size in [const Size(320, 640), const Size(1440, 900)]) {
      await tester.binding.setSurfaceSize(size);
      for (final pantalla in pantallas.values) {
        await tester.pumpWidget(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: crearTema(),
            home: pantalla,
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      }
    }
  });
}
