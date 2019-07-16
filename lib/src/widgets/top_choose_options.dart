import 'package:flutter/material.dart';
import 'package:vs_wallpapers/src/bloc/full_app_provider.dart';
import 'package:vs_wallpapers/src/screens/favourite_screen/favourite_screen.dart';

class TopChooseOptionsWidget extends StatefulWidget {
  @override
  _TopChooseOptionsWidgetState createState() => _TopChooseOptionsWidgetState();
}

class _TopChooseOptionsWidgetState extends State<TopChooseOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    TextStyle blackTextstyle =
        TextStyle(fontWeight: FontWeight.w800, color: Colors.black);
    TextStyle whiteTextstyle =
        TextStyle(fontWeight: FontWeight.w800, color: Colors.white);
    FullAppBloc fullAppBloc = FullAppProvider.of(context);
    return StreamBuilder(
        stream: fullAppBloc.topOption,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            fullAppBloc.setTopOption(0);
            return Container();
          }

          print(snapshot.data);
          return Column(
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 125.0,
                    child: FloatingActionButton.extended(
                      heroTag: "popular",
                      backgroundColor:
                          (snapshot.data == 0) ? Colors.orange : Colors.white,
                      onPressed: () {
                        fullAppBloc.setTopOption(0);
//                      Navigator.pushNamed(context, '/');
                      },
                      label: (snapshot.data == 0)
                          ? Text("Popular", style: whiteTextstyle)
                          : Text(
                              "Popular",
                              style: blackTextstyle,
                            ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 100.0,
                    child: FloatingActionButton.extended(
                      heroTag: "search",
                      backgroundColor:
                          (snapshot.data == 1) ? Colors.orange : Colors.white,
                      onPressed: () {
                        fullAppBloc.setTopOption(1);
//                      Navigator.pushNamed(context, '/search');
                      },
                      label: (snapshot.data == 1)
                          ? Text("Search", style: whiteTextstyle)
                          : Text(
                              "Search",
                              style: blackTextstyle,
                            ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  IconButton(icon: Icon(Icons.favorite,color: Colors.red,), onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouriteScreen()));
                  })
                ],
              ),
            ],
          );
        });
  }
}
