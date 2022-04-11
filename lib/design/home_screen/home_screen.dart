import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/design/breaking_news/breaking_news.dart';
import 'package:flutter_news_app/design/home_screen/bloc/home_screen_bloc.dart';
import 'package:flutter_news_app/design/search_news/search_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late HomeScreenBloc _homeScreenBloc;

  @override
  void initState() {
    super.initState();

    _homeScreenBloc = HomeScreenBloc();
    _homeScreenBloc.add(const HomeScreenInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('News App')),
        body: BlocProvider.value(
          value: _homeScreenBloc,
          child: BlocListener<HomeScreenBloc, HomeScreenState>(
            listener: ((context, state) async {}),
            child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                builder: ((context, state) {
              if (state is HomeScreenBreakingNewsSelectedState ||
                  state is HomeScreenInitialState) {
                return const BreakingNews();
              } else {
                return const SearchNews();
              }
            })),
          ),
        ),
        bottomNavigationBar: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            bloc: _homeScreenBloc,
            builder: (context, state) {
              return BottomNavigationBar(
                selectedItemColor: Colors.deepPurple,
                currentIndex: _selectedIndex,
                onTap: ((value) {
                  if (value == 0) {
                    _homeScreenBloc.add(const HomeScreenBreakingNewsEvent());
                  } else {
                    _homeScreenBloc.add(const HomeScreenSearchNewsEvent());
                  }
                  _selectedIndex = value;
                }),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.newspaper),
                    label: 'Breaking News',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: 'Search News')
                ],
              );
            }));
  }
}
