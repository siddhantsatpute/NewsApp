import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(const HomeScreenInitialState()) {
    on<HomeScreenEvent>((event, emit) {});

    on<HomeScreenInitialEvent>(
      (event, emit) => emit(const HomeScreenInitialState()),
    );

    on<HomeScreenBreakingNewsEvent>(
      (event, emit) => emit(const HomeScreenBreakingNewsSelectedState()),
    );

    on<HomeScreenSearchNewsEvent>(
      (event, emit) => emit(const HomeScreenSearchNewsSelectedState()),
    );
  }
}
