import 'package:flutter/material.dart';
import 'search_bloc.dart';
export 'search_bloc.dart';

class SearchProvider extends InheritedWidget {
  final SearchBloc bloc;

  SearchProvider({Key key, Widget child})
      : bloc = SearchBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static SearchBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(SearchProvider)
    as SearchProvider)
        .bloc;
  }
}
