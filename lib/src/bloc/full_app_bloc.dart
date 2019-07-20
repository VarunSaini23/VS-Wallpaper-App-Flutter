import 'package:rxdart/rxdart.dart';
import 'package:vs_wallpapers/src/models/single_image_model.dart';
import 'package:vs_wallpapers/src/network/db_provider.dart';
import 'package:vs_wallpapers/src/network/repository.dart';

class FullAppBloc {
  final _topOptionProvider = BehaviorSubject<int>();
  final _favouritesSubject = BehaviorSubject<int>();
  final _isFavouriteSubject = BehaviorSubject<bool>();
  Repository repository = Repository();
  final dbHelper = DatabaseHelper.instance;

  Observable<int> get topOption => _topOptionProvider.stream;
  Observable<int> get favourite => _favouritesSubject.stream;
  Observable<bool> get isFavourite => _isFavouriteSubject.stream;

  setTopOption(int option) {
    _topOptionProvider.sink.add(option);
  }

  setAsFavourite(SingleImageModel model) async {
    int key = await repository.setAsFavourite(model);
    _favouritesSubject.sink.add(key);
  }

  removeAsFavourite(SingleImageModel model) async {
    int key = await repository.removeAsFavourite(model);
    _favouritesSubject.sink.add(0);
    _isFavouriteSubject.add(false);
  }




  dispose() {
    _topOptionProvider.close();
    _favouritesSubject.close();
  }

  getFavouriteStatus(int id) async {
    List<int> ids = await dbHelper.getAllFavouritesIds();
    bool status = false;
    for (int i in ids){
      if(i==id){
        status = true;
         break;
      }
    }
    _isFavouriteSubject.add(status);

  }
}
