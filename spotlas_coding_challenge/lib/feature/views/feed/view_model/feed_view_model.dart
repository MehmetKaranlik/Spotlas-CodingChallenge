import 'package:flutter/material.dart';
import 'package:spotlas_coding_challenge/core/base/controller/base_controllder.dart';
import 'package:spotlas_coding_challenge/feature/views/feed/service/IFeed_service.dart';
import 'package:spotlas_coding_challenge/feature/views/feed/service/feed_service.dart';

import '../model/feed_model.dart';

class FeedViewModel extends BaseViewModel {
  // properties
  final ScrollController scrollController = ScrollController();
  IFeedServie get service => FeedService(networkService);
  int page = 1;
  bool isLoading = false;
  var paginationBuffer = 0;

  List<Post> posts = [];

  bool get buildPaginationCondition {
    final maxExtend = scrollController.position.maxScrollExtent;
    final currentExtend = scrollController.position.pixels;
    const pixelBuffer = 100;
    return maxExtend - currentExtend <= pixelBuffer;
  }

  Future<void> fetchPosts() async {
    changeLoading();
    final result = await service.fetchPosts(page) ?? [];
    posts.addAll(result);
    changeLoading();
    notifyListeners();
  }

  void changeLoading() {
    isLoading = !isLoading;
  }

  void balanceState() {
    paginationBuffer = posts.length + 15;
    changeLoading();
  }
}
