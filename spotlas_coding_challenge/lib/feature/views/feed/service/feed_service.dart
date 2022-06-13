import 'package:spotlas_coding_challenge/core/constants/enum/network_path.dart';
import 'package:spotlas_coding_challenge/feature/views/feed/model/feed_model.dart';
import 'package:spotlas_coding_challenge/feature/views/feed/service/IFeed_service.dart';
import 'package:vexana/vexana.dart';

class FeedService extends IFeedServie {
  FeedService(super.manager);

  @override
  Future<List<Post>?> fetchPosts(int page) async {
    final response = await manager.send<Post, List<Post>>(
      '${NetworkPath.feedUrl.value}?page=$page',
      parseModel: Post(),
      method: RequestType.GET,
    );
    if (response.data != null) return response.data;
  }
}
