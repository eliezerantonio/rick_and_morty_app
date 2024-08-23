import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/entities.dart';
import '../../../providers/characters_provider.dart';
import '../../details_screen/details_screen.dart';

class CharacterList extends ConsumerStatefulWidget {
  final List<CharacterEntity> characters;
  const CharacterList(this.characters, {super.key});

  @override
  CharacterListState createState() => CharacterListState();
}

class CharacterListState extends ConsumerState<CharacterList> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 200 >= scrollController.position.maxScrollExtent) {
        ref.read(charactersProvider.notifier).getAll();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      itemCount: widget.characters.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        final character = widget.characters[index];

        return GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen(character.id))),
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Image.network(
                    character.image,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(character.name),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
