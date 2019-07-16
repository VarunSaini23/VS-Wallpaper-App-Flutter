import 'package:flutter/material.dart';
import 'package:vs_wallpapers/src/bloc/search_screen/search_provider.dart';
import 'package:vs_wallpapers/src/screens/filter_screen/filter_screen.dart';
import 'package:vs_wallpapers/src/widgets/images_grid.dart';

import 'widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchProvider(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0),
            SearchBar(),
            ImagesGrid(),
          ],
        ),
      ),
    );
  }
}
