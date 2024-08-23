import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/presentation/generated/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Assets.images.logo.image(width: 210, height: 100),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
