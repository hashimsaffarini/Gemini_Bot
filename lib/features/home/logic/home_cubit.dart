
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemeni_bot/features/home/data/message_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  bool isTyping = false;
  TextEditingController textEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<MessageModel> messagesList = [];
  ScrollController scrollController = ScrollController();

  void changeTypingState(bool value) {
    isTyping = value;
    emit(HomeTypingState(isTyping));
  }

  void clearText() {
    textEditingController.clear();
    changeTypingState(false);
  }

  void sendMessage() {
    if (formKey.currentState!.validate()) {
      emit(MessageSending());
      messages.add(
        MessageModel(
          message: textEditingController.text,
          sender: "user",
          time: DateTime.now().toString(),
        ),
      );
      messagesList = messages;
      scrollToBottom();
      textEditingController.clear();

      emit(MessageSent(messages));
    }
  }

  void scrollToBottom() {
    // Animate to the bottom
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 100,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
