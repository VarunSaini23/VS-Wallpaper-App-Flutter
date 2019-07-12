import 'package:vs_wallpapers/src/models/api_result_model.dart';

import 'pixabay_api_provider.dart';

class Repository {

  PixabayApiProvider pixabayApiProvider = PixabayApiProvider();

  Future<ApiResultModel> getSearchResult(String query) async {
    final result = await pixabayApiProvider.getSearchResult(query);
    return result;
  }

}