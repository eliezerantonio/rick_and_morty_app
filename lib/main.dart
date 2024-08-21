import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app/presentation/screens/splash_screen/splash_screen.dart';

import 'presentation/providers/theme_provider.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(brightness: isDark ? Brightness.dark : Brightness.light),
      home: const SplashScreen(),
    );
  }
}
