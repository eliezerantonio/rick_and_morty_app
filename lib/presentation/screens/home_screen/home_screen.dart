import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/entities.dart';
import '../../providers/providers.dart';
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
      body: charactersProviderAsync.when(
        data: (data) => Stack(
          children: [
            CharacterList(data.characters),
            if (data.isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
        error: (error, _) => Text("$error"),
        loading: () => const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(themeProvider.notifier).toggle();
        },
        child: Icon(isDark ? Icons.brightness_4 : Icons.brightness_2),
      ),
    );
  }
}

class CharacterList extends ConsumerStatefulWidget {
  final List<CharacterEntity> characters;
  const CharacterList(this.characters, {super.key});

  @override
  CharacterListState createState() => CharacterListState();
}
