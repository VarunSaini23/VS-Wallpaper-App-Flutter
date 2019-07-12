import 'package:rxdart/rxdart.dart';
import 'package:vs_wallpapers/src/models/api_result_model.dart';
import 'package:vs_wallpapers/src/network/repository.dart';

class SearchBloc{

  final _searchResults = BehaviorSubject<ApiResultModel>();
  Repository repository = Repository();

  Observable<ApiResultModel> get searchResults => _searchResults.stream;

  startSearch(String query) async {
    final result = await repository.getSearchResult(query);
    print(result.total);
    _searchResults.sink.add(result);
  }

  dispose(){
//      _topOptionProvider.close();
  }

}