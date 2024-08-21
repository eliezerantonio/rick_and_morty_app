import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../components/components.dart';
import 'components/character_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ref.read(charactersProvider.notifier).getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final charactersProviderAsync = ref.watch(charactersProvider);

    final isDark = ref.watch(themeProvider);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: charactersProviderAsync.whenOrNull(
        data: (data) => Stack(
          children: [
            CharacterList(data.characters),
            if (data.isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
        error: (error, _) => Text("$error"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(themeProvider.notifier).toggle,
        child: Icon(isDark ? Icons.brightness_4 : Icons.brightness_2),
      ),
    );
  }
}
