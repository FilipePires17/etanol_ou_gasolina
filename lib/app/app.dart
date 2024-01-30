import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

import '../routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: false,
      ),
      title: 'Etanol ou Gasolina',
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.home,
      ),
    );
  }
}
