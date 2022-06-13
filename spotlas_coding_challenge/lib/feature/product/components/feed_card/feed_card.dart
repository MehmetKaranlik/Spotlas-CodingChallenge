import 'package:flutter/material.dart';
import 'package:spotlas_coding_challenge/core/extensions/context_extensions.dart';
import 'package:spotlas_coding_challenge/core/extensions/string_extensions.dart';
import 'package:spotlas_coding_challenge/core/widgets/dynamic_horizontal_space.dart';
import 'package:spotlas_coding_challenge/core/widgets/dynamic_vertical_space.dart';
import 'package:spotlas_coding_challenge/feature/product/components/avatar_overlay.dart';
import 'package:spotlas_coding_challenge/feature/product/components/buttons/tag_button.dart';
import 'package:spotlas_coding_challenge/feature/product/components/feed_card/feed_card_image_holder.dart';
import 'package:spotlas_coding_challenge/feature/product/components/feed_card/feed_toolbar.dart';
import 'package:spotlas_coding_challenge/feature/product/components/feed_card/toggle_text.dart';

import '../../../views/feed/model/feed_model.dart';

class FeedCard extends StatefulWidget {
  final Post post;
  const FeedCard({Key? key, required this.post}) : super(key: key);

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImageHolder(),
        const DynamicVerticalSpace(spacing: ContextSpacing.medium),
        const Toolbar(),
        const DynamicVerticalSpace(spacing: ContextSpacing.medium),
        ToggleText(
          authorName: widget.post.author?.fullName ?? "",
          caption: widget.post.caption?.text ?? "",
        ),
        const DynamicVerticalSpace(spacing: ContextSpacing.xsmall),
        _buildTagButtonBuilder(),
        const DynamicVerticalSpace(spacing: ContextSpacing.small),
        _buildDateRow(),
        const DynamicVerticalSpace(spacing: ContextSpacing.large),
      ],
    );
  }

  FeedCardImageHolder _buildImageHolder() {
    return FeedCardImageHolder(
      avatarUrl: widget.post.author?.photoUrl ?? "",
      overlaySize: OverlaySize.small,
      media: widget.post.media ?? [],
      avatarRadius: 49,
      placeAvatarUrl: widget.post.spot?.logo?.url ?? "",
      userFullname: widget.post.author?.fullName ?? "",
      userTag: widget.post.author?.username ?? "",
      spotName: widget.post.spot?.name ?? "",
      spotTag: widget.post.spot?.location?.display ?? "",
    );
  }

  Row _buildDateRow() {
    return Row(
      children: [
        DynamicHorizontalSpace(spacing: ContextSpacing.small),
        Text(
          widget.post.createdAt.timeAgo(),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  SizedBox _buildTagButtonBuilder() {
    return SizedBox(
      height: (widget.post.tags?.isNotEmpty ?? false) ? 38 : 0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildSingleTagButton(index, context);
        },
        separatorBuilder: (ctx, index) => const DynamicHorizontalSpace(spacing: ContextSpacing.xxsmall),
        itemCount: widget.post.tags?.length ?? 0,
      ),
    );
  }

  Padding _buildSingleTagButton(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? context.padding(ContextSpacing.small) : 0, bottom: 3, top: 3),
      child: TagButton(
        buttonTitle: widget.post.tags?[index].name ?? "",
      ),
    );
  }
}
