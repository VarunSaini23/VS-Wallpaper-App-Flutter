import 'package:flutter/material.dart';
import 'package:vs_wallpapers/src/bloc/popular_screen/popular_provider.dart';
import 'package:vs_wallpapers/src/widgets/images_grid.dart';
import 'package:vs_wallpapers/src/widgets/popular_images_grid.dart';

class PopularScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopularProvider(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            PopularImagesGrid(),
          ],
        )
      ),
    );
  }
}
