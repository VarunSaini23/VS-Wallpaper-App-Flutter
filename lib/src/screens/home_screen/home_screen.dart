import 'package:flutter/material.dart';
import 'package:vs_wallpapers/src/bloc/full_app_provider.dart';
import 'package:vs_wallpapers/src/screens/popularscreen/popular_screen.dart';
import 'package:vs_wallpapers/src/screens/search_screen/search_screen.dart';
import 'package:vs_wallpapers/src/widgets/top_choose_options.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FullAppBloc fullAppBloc = FullAppProvider.of(context);

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            TopChooseOptionsWidget(),
            StreamBuilder(
              stream: fullAppBloc.topOption,
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Container();
                }

                switch(snapshot.data){
                  case 0:
                    return PopularScreen();
                    break;
                  case 1:
                    return SearchScreen();
                    break;
                }
              },
            )
          ],
      ),
        ),
    );
  }
}
