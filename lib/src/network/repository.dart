import 'package:vs_wallpapers/src/models/api_result_model.dart';
import 'package:vs_wallpapers/src/models/single_image_model.dart';

import 'db_provider.dart';
import 'pixabay_api_provider.dart';

class Repository {

  PixabayApiProvider pixabayApiProvider = PixabayApiProvider();
  final dbHelper = DatabaseHelper.instance;

  Future<ApiResultModel> getSearchResult(String query) async {
    final result = await pixabayApiProvider.getSearchResult(query);
    return result;
  }

  Future<int> setAsFavourite(SingleImageModel model) async {
    final key = await dbHelper.insert(model.toMap());
    print(key);
    return key;
  }

  removeAsFavourite(SingleImageModel model) async {
    final key = await dbHelper.delete(model.id);
    print(key);
    return key;
  }

  Future<List<SingleImageModel>> getFavouriteWall() async{
    final result = await dbHelper.queryAllRows();
    return result;
  }



}