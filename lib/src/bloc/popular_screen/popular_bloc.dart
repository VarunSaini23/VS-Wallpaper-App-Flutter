import 'package:rxdart/rxdart.dart';
import 'package:vs_wallpapers/src/models/api_result_model.dart';
import 'package:vs_wallpapers/src/models/single_image_model.dart';
import 'package:vs_wallpapers/src/network/repository.dart';

class PopularBloc{

    final _popularWallpapersProvider = BehaviorSubject<ApiResultModel>();
    final _favouriteWallpapersProvider = BehaviorSubject<List<SingleImageModel>>();
    Repository repository = Repository();

    Observable<ApiResultModel> get popularWallpapers => _popularWallpapersProvider.stream;
    Observable<List<SingleImageModel>> get favouriteWallpapers => _favouriteWallpapersProvider.stream;

    getPopularWall() async {
      final result = await repository.getSearchResult("nature");
      print(result.total);
      _popularWallpapersProvider.sink.add(result);
    }

    getFavouriteWall() async {
      final result = await repository.getFavouriteWall();
      _favouriteWallpapersProvider.sink.add(result);
    }

    dispose(){
      _popularWallpapersProvider.close();
    }

}