import 'package:flutter/material.dart';
import 'search_bloc.dart';
export 'search_bloc.dart';

class SearchProvider extends InheritedWidget {
  final SearchBloc searchBloc;

  SearchProvider({Key key, Widget child})
      : searchBloc = SearchBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static SearchBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(SearchProvider)
    as SearchProvider)
        .searchBloc;
  }
}
