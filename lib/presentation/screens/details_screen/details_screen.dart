import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../components/components.dart';

class DetailsScreen extends ConsumerWidget {
  final int id;

  const DetailsScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterProviderAsync = ref.watch(characterProvider(id));
    return Scaffold(
        appBar: const CustomAppBar(),
        body: switch (characterProviderAsync) {
          AsyncData(:final value) => Column(
              children: [
                FadeInDown(
                  child: Image.network(
                    value.image,
                    fit: BoxFit.cover,
                    height: 300,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                CustomListTile(
                  title: "Status",
                  subtitle: value.status,
                ),
                CustomListTile(
                  title: "Specie",
                  subtitle: value.species,
                ),
                CustomListTile(
                  title: "Gender",
                  subtitle: value.gender,
                ),
              ],
            ),
          AsyncError(:final error) => Text('error: $error'),
          _ => const Center(child: CircularProgressIndicator()),
        });
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Text(subtitle),
    );
  }
}
