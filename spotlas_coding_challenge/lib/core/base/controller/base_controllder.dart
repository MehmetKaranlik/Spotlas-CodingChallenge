import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../network/base_network_manager.dart';

class BaseViewModel extends ChangeNotifier {
  INetworkManager networkService = BaseNetworkService.instance.networkManager;
}
