
import 'package:bloc/bloc.dart';


//evennya string bentuknya state int
class CounterBlock extends Bloc<String, int>{

  CounterBlock() : super(5);

  int _counter  = 0;

  int get counter => _counter;

  @override
  Stream<int> mapEventToState(event) async* {
    if(event=="Add"){
      _counter++;
    } else {
     _counter--;
    }

    // return stream harus yield
    //async* buat stream
    // async biasa buat future
    yield _counter;
  }

}