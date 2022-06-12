class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    _instance ??= _instance = ImageConstants._init();
    return _instance!;
  }

  ImageConstants._init();

  String get icChatbubble => toPng("ic_chatbubble");
  String get icHeartEmpty => toPng("ic_heart_empty");
  String get icHeartFilled => toPng("ic_heart_filled");
  String get icMap => toPng("ic_map");
  String get icPaperPlane => toPng("ic_paperplane");
  String get icStarFilled => toPng("ic_star_filled");
  String get icStarEmpty => toPng("ic_star_empty");
  String toPng(value) => 'assets/icons/$value.png';
}
