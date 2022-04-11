part of 'breaking_news_bloc.dart';

abstract class BreakingNewsEvent extends Equatable {
  const BreakingNewsEvent();

  @override
  List<Object> get props => [];
}

class BreakingNewsInitialEvent extends BreakingNewsEvent {
  const BreakingNewsInitialEvent();

  @override
  List<Object> get props => [];
}

class BreakingNewsLoadingEvent extends BreakingNewsEvent {
  const BreakingNewsLoadingEvent();

  @override
  List<Object> get props => [];
}

class BreakingNewsFetchNewsEvent extends BreakingNewsEvent {
  const BreakingNewsFetchNewsEvent();

  @override
  List<Object> get props => [];
}

class BreakingNewsNewsFetchedEvent extends BreakingNewsEvent {
  const BreakingNewsNewsFetchedEvent();

  @override
  List<Object> get props => [];
}