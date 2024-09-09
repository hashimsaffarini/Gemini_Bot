import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  bool isTyping = false;

  void changeTypingState(bool value) {
    isTyping = value;
    emit(HomeTypingState(isTyping));
  }
}
