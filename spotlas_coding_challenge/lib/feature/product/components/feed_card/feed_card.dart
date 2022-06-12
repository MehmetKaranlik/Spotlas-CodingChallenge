import 'package:flutter/material.dart';
import 'package:spotlas_coding_challenge/core/extensions/context_extensions.dart';
import 'package:spotlas_coding_challenge/core/widgets/dynamic_vertical_space.dart';
import 'package:spotlas_coding_challenge/feature/product/components/avatar_overlay.dart';
import 'package:spotlas_coding_challenge/feature/product/components/feed_card/feed_card_image_holder.dart';
import 'package:spotlas_coding_challenge/feature/product/components/feed_card/feed_toolbar.dart';

class FeedCard extends StatefulWidget {
  const FeedCard({Key? key}) : super(key: key);

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        FeedCardImageHolder(
          avatarUrl: "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
          overlaySize: OverlaySize.small,
          imageUrl: "https://via.placeholder.com/375x468",
          avatarRadius: 49,
          placeAvatarUrl: "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
        ),
        DynamicVerticalSpace(spacing: ContextSpacing.medium),
        Toolbar(),
      ],
    );
  }
}
