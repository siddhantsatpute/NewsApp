part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenInitialEvent extends HomeScreenEvent {
  const HomeScreenInitialEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenBreakingNewsEvent extends HomeScreenEvent {
  const HomeScreenBreakingNewsEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenSearchNewsEvent extends HomeScreenEvent {
  const HomeScreenSearchNewsEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenLoadingEvent extends HomeScreenEvent {
  const HomeScreenLoadingEvent();

  @override
  List<Object> get props => [];
}
