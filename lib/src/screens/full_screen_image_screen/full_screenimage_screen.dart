import 'package:flutter/material.dart';
import 'package:vs_wallpapers/src/bloc/full_app_provider.dart';
import 'package:vs_wallpapers/src/models/single_image_model.dart';
import 'package:vs_wallpapers/src/network/db_provider.dart';
import 'package:wallpaper/wallpaper.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';


class FullScreenImageScreen extends StatelessWidget {
  final SingleImageModel singleImageModel;

  FullScreenImageScreen({this.singleImageModel});

  @override
  Widget build(BuildContext context) {
    FullAppBloc fullAppBloc = FullAppProvider.of(context);
    fullAppBloc.getFavouriteStatus(singleImageModel.id);

    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: fullAppBloc.isFavourite,
          builder: (context, snapshot1) {
            if(!snapshot1.hasData){
              return Container();
            }
            return Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0, top: 40.0),
                    height: 500.0,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/loading1.gif",
                        image: singleImageModel.largeImageURL,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Center(
                    child: Wrap(
                      children: tagChips(singleImageModel.tags.split(", ")),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FloatingActionButton.extended(
                        heroTag: "setAs",
                        label: Text("Set as"),
                        onPressed: () {
                          _settingModalBottomSheet(context);
                        },
                      ),
                      StreamBuilder(
                          stream: fullAppBloc.favourite,
                          builder: (context, snapshot) {
                            return IconButton(
                                icon: ((snapshot.data == singleImageModel.id) || snapshot1.data)
                                    ? Icon(Icons.favorite, color: Colors.red)
                                    : Icon(Icons.favorite_border,
                                        color: Colors.red),
                                onPressed: () {
                                  if(((snapshot.data == singleImageModel.id) || snapshot1.data)) {
                                    fullAppBloc.removeAsFavourite(
                                        singleImageModel);
                                  }else{
                                    fullAppBloc.setAsFavourite(
                                        singleImageModel);
                                  }
                                });
                          }),
                      Container(
                        height: 60.0,
                        child: FloatingActionButton(
                            onPressed: () async {
                              try {
                                // Saved with this method.
                                var imageId = await ImageDownloader.downloadImage(singleImageModel.largeImageURL,);
                                var path = await ImageDownloader.findPath(imageId);
                                await ImageDownloader.open(path);
                                if (imageId == null) {
                                  return;
                                }

                                // Below is a method of obtaining saved image information.
                                var fileName =
                                    await ImageDownloader.findName(imageId);
//                                var path = await ImageDownloader.findPath(imageId);
                                var size =
                                    await ImageDownloader.findByteSize(imageId);
                                var mimeType =
                                    await ImageDownloader.findMimeType(imageId);
                              } catch (error) {
                                print(error);
                              }
                            },
                            child: Icon(Icons.file_download)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: FloatingActionButton.extended(
                          heroTag: "shareVia",
                          label: Text("Share this wallpaper"),
                          onPressed: () {
                            Share.share(
                                'Check out this cool Wallpaper on ${singleImageModel.pageURL}');
                          },
                        ),
                      ),
                      Container(
//                    padding: EdgeInsets.only(top:8.0),
                        height: 80.0,
                        child: FloatingActionButton(
                          backgroundColor: Colors.orange,
                          heroTag: "homePage",
                          onPressed: () async {
                            _launchURL(singleImageModel.pageURL);
                          },
                          child: Image.asset(
                            "assets/images/pixabay.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.looks_one),
                  title: new Text('Home Screen'),
                  onTap: () async {
                    String res;
                    res = await Wallpaper.homeScreen(
                        singleImageModel.largeImageURL);
                    Navigator.pop(context);
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.looks_two),
                  title: new Text('Lock Screen'),
                  onTap: () async {
                    String res;
                    res = await Wallpaper.lockScreen(
                        singleImageModel.largeImageURL);
                    Navigator.pop(context);
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.threesixty),
                  title: new Text('Both'),
                  onTap: () async {
                    String res;
                    res = await Wallpaper.bothScreen(
                        singleImageModel.largeImageURL);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  List<Widget> tagChips(List<String> tags) {
    List<Widget> chips = [];
    for (var i = 0; i < tags.length; i++) {
      chips.add(Chip(
        labelStyle:
            TextStyle(fontWeight: FontWeight.w700, color: Colors.grey[800]),
        label: Text(tags.elementAt(i)),
        padding: EdgeInsets.all(10.0),
      ));
      chips.add(SizedBox(
        width: 10.0,
      ));
    }
    return chips;
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
