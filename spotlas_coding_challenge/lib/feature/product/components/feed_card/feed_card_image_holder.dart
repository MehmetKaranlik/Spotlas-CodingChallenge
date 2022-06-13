import 'package:flutter/material.dart';
import 'package:spotlas_coding_challenge/core/constants/assets/image_constants.dart';
import 'package:spotlas_coding_challenge/core/extensions/context_extensions.dart';
import 'package:spotlas_coding_challenge/core/widgets/dynamic_horizontal_space.dart';
import 'package:spotlas_coding_challenge/feature/product/components/avatar_overlay.dart';
import 'package:spotlas_coding_challenge/feature/product/components/buttons/more_action_button.dart';
import 'package:spotlas_coding_challenge/feature/views/feed/model/feed_model.dart';

class FeedCardImageHolder extends StatefulWidget {
  final List<Media> media;
  final String avatarUrl;
  final OverlaySize overlaySize;
  final double avatarRadius;
  final String placeAvatarUrl;
  final String userFullname;
  final String userTag;
  final String spotName;
  final String spotTag;
  const FeedCardImageHolder({
    Key? key,
    required this.media,
    required this.avatarUrl,
    required this.overlaySize,
    required this.avatarRadius,
    required this.placeAvatarUrl,
    required this.userFullname,
    required this.userTag,
    required this.spotName,
    required this.spotTag,
  }) : super(key: key);

  @override
  State<FeedCardImageHolder> createState() => _FeedCardImageHolderState();
}

class _FeedCardImageHolderState extends State<FeedCardImageHolder> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints(
            minHeight: 250,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: _buildImageBuilder(),
          ),
        ),
        _buildTopOverlay(context),
        _buildBottomOverlay(context)
      ],
    );
  }

  PageView _buildImageBuilder() {
    return PageView.builder(
      itemBuilder: (context, index) {
        return Image.network(
          widget.media[index].url ?? "",
          fit: BoxFit.cover,
          loadingBuilder: _loadingBuilder,
        );
      },
      itemCount: widget.media.length,
    );
  }

  Positioned _buildTopOverlay(BuildContext context) {
    return Positioned(
      left: context.padding(ContextSpacing.small),
      top: context.padding(ContextSpacing.small),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            _buildTopOverlayAvatar(),
            const DynamicHorizontalSpace(spacing: ContextSpacing.small),
            _buildNameAndTag(),
            const Spacer(),
            const MoreActionButton(),
            const DynamicHorizontalSpace(spacing: ContextSpacing.large)
          ],
        ),
      ),
    );
  }

  AvatarOverlay _buildTopOverlayAvatar() {
    return AvatarOverlay(
      borderColor: Color(0xffFF0040),
      avatarUrl: widget.avatarUrl,
      overlaySize: widget.overlaySize,
      avatarRadius: widget.avatarRadius,
    );
  }

  Column _buildNameAndTag() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.userFullname,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          widget.userTag,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomOverlay(BuildContext context) {
    return Positioned(
      left: context.padding(ContextSpacing.small),
      bottom: context.padding(ContextSpacing.small),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            AvatarOverlay(
              borderColor: Colors.white,
              avatarUrl: widget.placeAvatarUrl,
              overlaySize: widget.overlaySize,
              avatarRadius: widget.avatarRadius,
            ),
            const DynamicHorizontalSpace(spacing: ContextSpacing.small),
            _buildBottomOverlayText(),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Image.asset(
                isFavorite ? ImageConstants.instance.icStarFilled : ImageConstants.instance.icStarEmpty,
                color: isFavorite ? Colors.yellow : Colors.white,
              ),
            ),
            const DynamicHorizontalSpace(spacing: ContextSpacing.xlarge),
          ],
        ),
      ),
    );
  }

  Column _buildBottomOverlayText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.spotName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          widget.spotTag,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _loadingBuilder(context, child, progress) {
    return progress == null
        ? child
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
