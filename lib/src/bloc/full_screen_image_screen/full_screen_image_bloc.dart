//import 'package:rxdart/rxdart.dart';
//import 'package:vs_wallpapers/src/models/api_result_model.dart';
//import 'package:vs_wallpapers/src/network/repository.dart';
//
//class SearchBloc{
//
//  final _searchResults = BehaviorSubject<ApiResultModel>();
//  Repository repository = Repository();
//
//  Observable<ApiResultModel> get searchResults => _searchResults.stream;
////  Observable<String> get inputText => _inputText.stream;
//
//  startSearch(String query) async {
//    final result = await repository.getSearchResult(query);
//    print(result.total);
//    _searchResults.sink.add(result);
//  }
//
//  putSearchText(String text){
//    _inputText.sink.add(text);
//  }
//
//  dispose(){
////      _searchResults.close();
////      _inputText.close();
//  }
//
//}