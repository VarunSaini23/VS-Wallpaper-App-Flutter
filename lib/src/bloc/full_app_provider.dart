import 'package:flutter/material.dart';
import 'full_app_bloc.dart';
export 'full_app_bloc.dart';

class FullAppProvider extends InheritedWidget {
  final FullAppBloc bloc;

  FullAppProvider({Key key, Widget child})
      : bloc = FullAppBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static FullAppBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(FullAppProvider)
    as FullAppProvider)
        .bloc;
  }
}
