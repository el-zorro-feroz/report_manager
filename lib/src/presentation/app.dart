import 'package:flutter/material.dart';
import 'package:report_manager/src/presentation/pages/home_page.dart';

/// Root Application [Widget].
class App extends StatelessWidget {
  /// Returns an instance of [App].
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report Manager',
      themeMode: ThemeMode.light,
      theme: ThemeData.light(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
