import 'package:flutter/material.dart';

class AvatarOverlay extends StatelessWidget {
  final String avatarUrl;
  final OverlaySize overlaySize;
  final double avatarRadius;
  final Color borderColor;
  const AvatarOverlay({
    Key? key,
    required this.avatarUrl,
    required this.overlaySize,
    required this.avatarRadius,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: avatarRadius,
      height: avatarRadius,
      decoration: BoxDecoration(
        border: Border.all(
          width: _buildMargin(overlaySize),
          color: borderColor,
        ),
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black.withOpacity(0.8), blurRadius: 20),
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(avatarRadius),
          ),
          child: Image.network(avatarUrl)),
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
