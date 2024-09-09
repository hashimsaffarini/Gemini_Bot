part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeTypingState extends HomeState {
  final bool isTyping;

  HomeTypingState(this.isTyping);
}
