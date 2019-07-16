import 'package:rxdart/rxdart.dart';
import 'package:vs_wallpapers/src/models/single_image_model.dart';
import 'package:vs_wallpapers/src/network/db_provider.dart';
import 'package:vs_wallpapers/src/network/repository.dart';

class FullAppBloc {
  final _topOptionProvider = BehaviorSubject<int>();
  final _favouritesSubject = BehaviorSubject<int>();
  Repository repository = Repository();
  final dbHelper = DatabaseHelper.instance;

  Observable<int> get topOption => _topOptionProvider.stream;

  Observable<int> get favourite => _favouritesSubject.stream;

  setTopOption(int option) {
    _topOptionProvider.sink.add(option);
  }

  setAsFavourite(SingleImageModel model) async {
    int key = await repository.setAsFavourite(model);
    _favouritesSubject.sink.add(key);
  }

  dispose() {
    _topOptionProvider.close();
  }

  Future<List<int>> getAllFavouritesIds() async {
    return await dbHelper.getAllFavouritesIds();
  }
}
