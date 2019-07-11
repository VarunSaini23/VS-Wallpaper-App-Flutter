import 'package:flutter/material.dart';
import 'package:vs_wallpapers/src/bloc/full_app_provider.dart';

class TopChooseOptionsWidget extends StatefulWidget {
  @override
  _TopChooseOptionsWidgetState createState() => _TopChooseOptionsWidgetState();
}

class _TopChooseOptionsWidgetState extends State<TopChooseOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    TextStyle style =
    TextStyle(fontWeight: FontWeight.w800, color: Colors.orange);
    FullAppBloc fullAppBloc = FullAppProvider.of(context);
    return StreamBuilder(
        stream: fullAppBloc.topOption,
        builder: (context, snapshot) {

          if(!snapshot.hasData){
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
                  RaisedButton(
                    onPressed: () {
                      fullAppBloc.setTopOption(0);
//                      Navigator.pushNamed(context, '/');
                    },
                    child: (snapshot.data == 0)
                        ? Text("Popular", style: style)
                        : Text("Popular"),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      fullAppBloc.setTopOption(1);
//                      Navigator.pushNamed(context, '/search');
                    },
                    child: (snapshot.data == 1)
                        ? Text("Search", style: style)
                        : Text("Search"),
                  ),
                ],
              ),
            ],
          );
        });  }
}
