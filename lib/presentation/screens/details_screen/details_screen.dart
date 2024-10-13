import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../components/components.dart';
import 'components/components.dart';

class DetailsScreen extends ConsumerWidget {
  final int id;

  const DetailsScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterProviderAsync = ref.watch(characterProvider(id));
    return Scaffold(
      appBar: const CustomAppBar(),
      body: switch (characterProviderAsync) {
        AsyncData(:final value) => Stack(
            children: [
              Column(
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
              IconButton(
                onPressed: () {},
                icon: const ClipOval(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 0.2],
                        colors: [
                          Colors.transparent,
                          Colors.black38,
                        ],
                      ),
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        AsyncError(:final error) => Text('error: $error'),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
