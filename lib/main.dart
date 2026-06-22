import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SectionProvider()),
      ],
      child: const IecaHinarioApp(),
    ),
  );
}

class IecaHinarioApp extends StatelessWidget {
  const IecaHinarioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Comfortaa',
      ),
    );
  }
}
