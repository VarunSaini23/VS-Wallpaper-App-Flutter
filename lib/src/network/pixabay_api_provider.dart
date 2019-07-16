import 'dart:convert';
import "package:http/http.dart" show Client;
import 'package:vs_wallpapers/src/models/api_result_model.dart';


class PixabayApiProvider{
  
  Client client = Client();

  Future<ApiResultModel> getSearchResult(String query) async {
    final response = await client.get("https://pixabay.com/api/?key=13007914-26538da4b8e04a31c8b534a13&q=$query&per_page=200&orientation=vertical");
    final item = ApiResultModel.fromJson(json.decode(response.body));
    return item;

  }

}