import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/design/breaking_news/service/breaking_news_service.dart';
import 'package:flutter_news_app/network/api_responses/breaking_news_response.dart';

part 'breaking_news_event.dart';
part 'breaking_news_state.dart';

class BreakingNewsBloc extends Bloc<BreakingNewsEvent, BreakingNewsState> {
  BreakingNewsBloc() : super(const BreakingNewsInitialState()) {
    on<BreakingNewsEvent>((event, emit) {
      /*  if (event is BreakingNewsInitialState) {
        emit(const BreakingNewsInitialState());
      } */
    });

    on<BreakingNewsInitialEvent>(((event, emit) {
      emit(const BreakingNewsInitialState());
    }));

    on<BreakingNewsLoadingEvent>((event, emit) {
      emit(const BreakingNewsLoadingState());
    });

    on<BreakingNewsNewsFetchedEvent>(((event, emit) {
      emit(const BreakingNewsLoadingState());
    }));

    on<BreakingNewsFetchNewsEvent>(((event, emit) async {
      //Emit Loading state from here
      super.add(const BreakingNewsLoadingEvent());

      //Make API call to fetch the news from here
      var res = await BreakingNewsService.getNews();
      log('Breaking News Response :: $res');
      emit(BreakingNewsNewsFetchedState(res));
    }));
  }
}
