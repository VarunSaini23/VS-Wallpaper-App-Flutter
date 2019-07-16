import 'package:flutter/material.dart';
import 'popular_bloc.dart';
export 'popular_bloc.dart';

class PopularProvider extends InheritedWidget {
  final PopularBloc popularBloc;

  PopularProvider({Key key, Widget child})
      : popularBloc = PopularBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static PopularBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(PopularProvider)
    as PopularProvider)
        .popularBloc;
  }
}
