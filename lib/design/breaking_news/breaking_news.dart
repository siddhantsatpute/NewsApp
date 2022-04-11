import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/design/breaking_news/bloc/breaking_news_bloc.dart';
import 'package:flutter_news_app/network/api_responses/breaking_news_response.dart';
import 'package:flutter_news_app/utils/news_item.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({Key? key}) : super(key: key);

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  late BreakingNewsBloc _breakingNewsBloc;

  @override
  void initState() {
    super.initState();
    _breakingNewsBloc = BreakingNewsBloc();
    _breakingNewsBloc.add(const BreakingNewsInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider.value(
      value: _breakingNewsBloc,
      child: BlocListener<BreakingNewsBloc, BreakingNewsState>(
        listener: (context, state) {},
        child: BlocBuilder<BreakingNewsBloc, BreakingNewsState>(
            builder: ((context, state) {
          if (state is BreakingNewsInitialState) {
            _breakingNewsBloc.add(const BreakingNewsFetchNewsEvent());
            return _showLoading();
          } else if (state is BreakingNewsFetchNewsState) {
            _breakingNewsBloc.add(const BreakingNewsLoadingEvent());
            return _showLoading();
          } else if (state is BreakingNewsLoadingState) {
            _breakingNewsBloc.add(const BreakingNewsNewsFetchedEvent());
            return _showLoading();
          } else if (state is BreakingNewsNewsFetchedState) {
            return _loadUI(state.articles);
          } else {
            return Container();
          }
        })),
      ),
    ));
  }

  Widget _showLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _loadUI(List<Articles> articles) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.all(10),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: articles.length,
              itemBuilder: (context, position) {
                return NewsItemWidget(
                  imageUrl: articles[position].urlToImage,
                  newsTitle: articles[position].title,
                  newsContent: articles[position].description,
                  newsAuthor: articles[position].author,
                  newsPostingTime: articles[position].publishedAt,
                );
              })),
    );
  }
}
