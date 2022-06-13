import 'package:flutter/material.dart';
import 'package:spotlas_coding_challenge/core/constants/assets/image_constants.dart';
import 'package:spotlas_coding_challenge/core/extensions/context_extensions.dart';
import 'package:spotlas_coding_challenge/core/widgets/dynamic_horizontal_space.dart';
import 'package:spotlas_coding_challenge/feature/product/components/avatar_overlay.dart';
import 'package:spotlas_coding_challenge/feature/product/components/buttons/more_action_button.dart';

class FeedCardImageHolder extends StatefulWidget {
  final String imageUrl;
  final String avatarUrl;
  final OverlaySize overlaySize;
  final double avatarRadius;
  final String placeAvatarUrl;
  const FeedCardImageHolder({
    Key? key,
    required this.imageUrl,
    required this.avatarUrl,
    required this.overlaySize,
    required this.avatarRadius,
    required this.placeAvatarUrl,
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
        Image.network(
          widget.imageUrl,
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
          loadingBuilder: _loadingBuilder,
        ),
        _buildTopOverlay(context),
        _buildBottomOverlay(context)
      ],
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
            AvatarOverlay(
              avatarUrl: widget.avatarUrl,
              overlaySize: widget.overlaySize,
              avatarRadius: widget.avatarRadius,
            ),
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

  Column _buildNameAndTag() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "nataliestevens",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          "Natilie Stevens",
          style: TextStyle(
            color: Colors.white,
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
      children: const [
        Text(
          "Pachamama",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          "Pruvian · Marylebone",
          style: TextStyle(
            color: Colors.white,
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
