import 'package:flutter/material.dart';
import 'package:vs_wallpapers/src/bloc/popular_screen/popular_provider.dart';
import 'package:vs_wallpapers/src/widgets/favourite_images_grid.dart';
import 'package:vs_wallpapers/src/widgets/images_grid.dart';
import 'package:vs_wallpapers/src/widgets/popular_images_grid.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    TODO: Writing in PopularBloc instead of making FavouriteBloc
    return Scaffold(
      body: SingleChildScrollView(
        child: PopularProvider(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40.0,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Favourites",style: TextStyle(color: Colors.orange,fontSize: 32.0,fontWeight: FontWeight.w700)),
                  ),
                  FavouriteImagesGrid(),
                ],
              )
          ),
        ),
      ),
    );
  }
}
