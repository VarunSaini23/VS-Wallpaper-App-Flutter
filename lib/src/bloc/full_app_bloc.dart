import 'package:rxdart/rxdart.dart';

class FullAppBloc{

    final _topOptionProvider = BehaviorSubject<int>();

    Observable<int> get topOption => _topOptionProvider.stream;

    setTopOption(int option){
      _topOptionProvider.sink.add(option);
    }



    dispose(){
//      _topOptionProvider.close();
    }

}