import 'package:flutter/material.dart';
import 'package:vs_wallpapers/src/bloc/search_screen/search_provider.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SearchBloc searchBloc = SearchProvider.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 5,
          child: searchField(searchBloc),
        ),
        Flexible(
          flex: 1,
          child: searchButton(searchBloc),
        ),
      ],
    );
  }

  Widget searchField(SearchBloc searchBloc) {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.black
        ),
        child: TextField(
          onChanged: (text) {
            searchBloc.putSearchText(text);
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: () {}),
            fillColor: Colors.grey,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          ),
        ),
      ),
    );
  }

  Widget searchButton(SearchBloc searchBloc) {
    return Container(
      height: 50.0,
      child: StreamBuilder(
          stream: searchBloc.inputText,
          builder: (context, snapshot) {
            return FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () {
                searchBloc.startSearch(snapshot.data);
              },
              child: Icon(Icons.arrow_forward),
            );
          }),
    );
  }
}
