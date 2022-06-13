import 'dart:io';

import 'package:spotlas_coding_challenge/core/constants/enum/network_path.dart';
import 'package:vexana/vexana.dart';

class BaseNetworkService {
  static BaseNetworkService? _instance;
  static BaseNetworkService get instance {
    _instance ??= _instance = BaseNetworkService._init();
    return _instance!;
  }

  late INetworkManager networkManager;

  BaseNetworkService._init() {
    networkManager = networkManagerOptions();
  }

  Future<void> retryToken() async {
    _instance = BaseNetworkService._init();
  }

  NetworkManager networkManagerOptions() {
    return NetworkManager(
      options: BaseOptions(
        baseUrl: NetworkPath.baseUrl.value,
        // headers: {HttpHeaders.authorizationHeader: 'Bearer $accessToken', 'lang': defineLangHeader()},
      ),
      isEnableLogger: true,
      onRefreshToken: (error, newService) {
        final errorService = refreshToken(error, newService);
        return errorService;
      },
      onRefreshFail: () async {},
    );
  }

  Future getToken(NetworkManager service) async {}

  Future<DioError> refreshToken(DioError error, NetworkManager newService) async {
    final tokenResponse = await getToken(newService);

    error.requestOptions.headers = {HttpHeaders.authorizationHeader: 'Bearer $tokenResponse'};
    return error;
  }
}
