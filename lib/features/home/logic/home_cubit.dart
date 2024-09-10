import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemeni_bot/core/networking/api_constant.dart';
import 'package:gemeni_bot/core/networking/gemini_api_services.dart';
import 'package:gemeni_bot/features/home/data/message_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  bool isTyping = false;
  TextEditingController textEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<MessageModel> messagesList = [];
  ScrollController scrollController = ScrollController();

  GeminiAPIService service = GeminiAPIService(apiKey: ApiConstants.apiKey);

  void changeTypingState(bool value) {
    isTyping = value;
    emit(HomeTypingState(isTyping));
  }

  void clearText() {
    textEditingController.clear();
    changeTypingState(false);
  }

  void clearMessages() {
    messagesList = [];
    emit(HomeInitial());
  }

  Future<void> sendMessage() async {
    if (formKey.currentState!.validate()) {
      emit(MessageSending());

      final userMessage = MessageModel(
        message: textEditingController.text,
        sender: "user",
        time: DateTime.now().toString(),
      );
      messages.add(userMessage);
      scrollToBottom();
      final userInput = textEditingController.text;
      textEditingController.clear();

      final botLoadingMessage = MessageModel(
        message: "Bot is typing...",
        sender: "bot",
        time: DateTime.now().toString(),
      );
      messages.add(botLoadingMessage);
      emit(MessageSent(List.from(messages)));
      scrollToBottom();

      try {
        final botResponse = await service.generateContent(userInput);

        messages.remove(botLoadingMessage);

        final botMessage = MessageModel(
          message: botResponse ?? "Sorry, I couldn't understand that.",
          sender: "bot",
          time: DateTime.now().toString(),
        );
        messages.add(botMessage);
        messagesList = messages;
        scrollToBottom();
        await Future.delayed(const Duration(seconds: 1));

        emit(MessageSent(List.from(messages)));
      } catch (e) {
        messages.remove(botLoadingMessage);
        final errorMessage = MessageModel(
          message: "Something went wrong. Please try again.",
          sender: "bot",
          time: DateTime.now().toString(),
        );
        messages.add(errorMessage);
        messagesList = messages;
        scrollToBottom();
        emit(MessageSent(List.from(messages)));
      }
    }
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
