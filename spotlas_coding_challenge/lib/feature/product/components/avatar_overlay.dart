import 'package:flutter/material.dart';

class AvatarOverlay extends StatelessWidget {
  final String avatarUrl;
  final OverlaySize overlaySize;
  final double avatarRadius;
  const AvatarOverlay({Key? key, required this.avatarUrl, required this.overlaySize, required this.avatarRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: avatarRadius,
      height: avatarRadius,
      // margin: EdgeInsets.all(_buildMargin(overlaySize)),
      decoration: BoxDecoration(
          border: Border.all(
            width: _buildMargin(overlaySize),
          ),
          shape: BoxShape.circle),
      child: Image.network(avatarUrl),
    );
  }

  double _buildMargin(OverlaySize size) {
    switch (size) {
      case OverlaySize.small:
        return 3.5;
      case OverlaySize.medium:
        return 16;
      case OverlaySize.large:
        return 24;
      default:
        return 8;
    }
  }
}

enum OverlaySize {
  small,
  medium,
  large,
}
