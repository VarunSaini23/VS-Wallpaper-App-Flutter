import 'package:flutter/material.dart';
import 'package:vs_wallpapers/src/bloc/popular_screen/popular_provider.dart';
import 'package:vs_wallpapers/src/bloc/search_screen/search_provider.dart';
import 'package:vs_wallpapers/src/models/single_image_model.dart';
import 'package:vs_wallpapers/src/screens/full_screen_image_screen/full_screenimage_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class FavouriteImagesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PopularBloc popularBloc = PopularProvider.of(context);
    popularBloc.getFavouriteWall();
    return StreamBuilder(
        stream: popularBloc.favouriteWallpapers,
        builder: (context, AsyncSnapshot<List<SingleImageModel>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: Container(
                  margin: EdgeInsets.only(top: 80.0),
              width: 300.0,
              height: 300.0,
              child: SvgPicture.asset("assets/images/favourite_placeholder.svg",
                  fit: BoxFit.fill, ),
            ));
          }
          return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0),
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (context, int index) {
                return Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenImageScreen(
                                    singleImageModel:
                                        snapshot.data.elementAt(index),
                                  ),
                            ));
                      },
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/loading1.gif",
                        image: snapshot.data.elementAt(index).previewURL,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
