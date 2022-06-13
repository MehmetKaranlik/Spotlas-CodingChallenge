import 'package:flutter/material.dart';
import 'package:spotlas_coding_challenge/core/extensions/context_extensions.dart';
import 'package:spotlas_coding_challenge/core/widgets/dynamic_horizontal_space.dart';
import 'package:spotlas_coding_challenge/core/widgets/dynamic_vertical_space.dart';
import 'package:spotlas_coding_challenge/feature/product/components/avatar_overlay.dart';
import 'package:spotlas_coding_challenge/feature/product/components/buttons/tag_button.dart';
import 'package:spotlas_coding_challenge/feature/product/components/feed_card/feed_card_image_holder.dart';
import 'package:spotlas_coding_challenge/feature/product/components/feed_card/feed_toolbar.dart';
import 'package:spotlas_coding_challenge/feature/product/components/feed_card/toggle_text.dart';

class FeedCard extends StatefulWidget {
  const FeedCard({Key? key}) : super(key: key);

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FeedCardImageHolder(
          avatarUrl: "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
          overlaySize: OverlaySize.small,
          imageUrl: "https://via.placeholder.com/375x468",
          avatarRadius: 49,
          placeAvatarUrl: "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
        ),
        const DynamicVerticalSpace(spacing: ContextSpacing.medium),
        const Toolbar(),
        const DynamicVerticalSpace(spacing: ContextSpacing.medium),
        const ToggleText(),
        const DynamicVerticalSpace(spacing: ContextSpacing.xsmall),
        _buildTagButtonBuilder(),
        const DynamicVerticalSpace(spacing: ContextSpacing.small),
        _buildDateRow(),
        const DynamicVerticalSpace(spacing: ContextSpacing.large),
      ],
    );
  }

  Row _buildDateRow() {
    return Row(
      children: const [
        DynamicHorizontalSpace(spacing: ContextSpacing.small),
        Text(
          "4 days ago",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  SizedBox _buildTagButtonBuilder() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildSingleTagButton(index, context);
        },
        separatorBuilder: (ctx, index) => const DynamicHorizontalSpace(spacing: ContextSpacing.xxsmall),
        itemCount: 100,
      ),
    );
  }

  Padding _buildSingleTagButton(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? context.padding(ContextSpacing.small) : 0, bottom: 3, top: 3),
      child: const TagButton(buttonTitle: "tag button"),
    );
  }
}
