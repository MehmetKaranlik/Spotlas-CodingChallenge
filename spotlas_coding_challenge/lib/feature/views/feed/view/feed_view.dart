import 'package:flutter/material.dart';
import 'package:spotlas_coding_challenge/feature/product/components/feed_card/feed_card.dart';

import '../view_model/feed_view_model.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  final viewModel = FeedViewModel();

  @override
  void initState() {
    _buildPaginationListener;
    _buildStateListener;
    viewModel.fetchPosts();
    super.initState();
  }

  void get _buildPaginationListener {
    viewModel.scrollController.addListener(() {
      if (viewModel.buildPaginationCondition) {
        viewModel.page += 1;
        viewModel.fetchPosts().whenComplete(() => viewModel.changeLoading());
      }
    });
  }

  void get _buildStateListener {
    viewModel.addListener(() {
      ((viewModel.paginationBuffer <= viewModel.posts.length) && !viewModel.isLoading) ? changeState() : null;
    });
  }

  void changeState() {
    viewModel.balanceState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Feed',
        style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black),
      ),
    );
  }

  ListView _buildBody() {
    return ListView.builder(
      controller: viewModel.scrollController,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return FeedCard(
          post: viewModel.posts[index],
        );
      },
      itemCount: viewModel.posts.length,
    );
  }
}
