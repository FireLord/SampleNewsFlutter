import 'package:bloc/bloc.dart';
import 'MainTabEvent.dart';
import 'MainTabState.dart';

class MainTabBloc extends Bloc<MainTabEvent, MainTabState> {
  MainTabBloc() : super(const MainTabInit(tabIndex: 0)) {
    on<TabChange>(tabChange);
  }

  void tabChange(TabChange event, Emitter<MainTabState> emit) {
    emit(MainTabInit(tabIndex: event.tabIndex));
  }
}