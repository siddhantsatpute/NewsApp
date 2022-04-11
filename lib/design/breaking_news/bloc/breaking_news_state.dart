part of 'breaking_news_bloc.dart';

abstract class BreakingNewsState extends Equatable {
  const BreakingNewsState();

  @override
  List<Object> get props => [];
}

class BreakingNewsInitialState extends BreakingNewsState {
  const BreakingNewsInitialState();

  @override
  List<Object> get props => [];
}

class BreakingNewsLoadingState extends BreakingNewsState {
  const BreakingNewsLoadingState();

  @override
  List<Object> get props => [];
}

class BreakingNewsFetchNewsState extends BreakingNewsState {
  const BreakingNewsFetchNewsState();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class BreakingNewsNewsFetchedState extends BreakingNewsState {
  List<Articles> articles;
  BreakingNewsNewsFetchedState(this.articles);

  @override
  List<Object> get props => [articles];
}
