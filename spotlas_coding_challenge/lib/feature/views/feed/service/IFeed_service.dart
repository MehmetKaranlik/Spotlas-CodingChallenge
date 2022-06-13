import 'package:spotlas_coding_challenge/feature/views/feed/model/feed_model.dart';
import 'package:vexana/vexana.dart';

abstract class IFeedServie {
  IFeedServie(this.manager);
  final INetworkManager manager;
  Future<List<Post>?> fetchPosts(int page);
}
