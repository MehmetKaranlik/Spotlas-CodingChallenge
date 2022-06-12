import 'package:flutter/material.dart';

class FeedViewModel extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  var paginationBuffer = 30;
  var list = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

  void populateTable() {
    list.addAll(List.generate(10, (i) => i));
    notifyListeners();
  }

  bool get buildPaginationCondition {
    final maxExtend = scrollController.position.maxScrollExtent;
    final currentExtend = scrollController.position.pixels;
    const pixelBuffer = 100;
    return maxExtend - currentExtend <= pixelBuffer;
  }
}
