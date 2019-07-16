import 'package:flutter/material.dart';
import 'package:vs_wallpapers/src/screens/home_screen/home_screen.dart';

import 'bloc/full_app_provider.dart';
import 'screens/popularscreen/popular_screen.dart';
import 'screens/search_screen/search_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FullAppProvider(
      child: MaterialApp(
        title: "VS Wallpapers",
        onGenerateRoute: route,
        theme: ThemeData(
            fontFamily: 'OpenSans',
        ),
      ),
    );
  }

  Route route(RouteSettings settings) {
    switch(settings.name){
      case '/':
        return MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            }
        );
        break;
      case '/filter':
        return MaterialPageRoute(
            builder: (context) {
              return SearchScreen();
            }
        );
    }
  }
}
