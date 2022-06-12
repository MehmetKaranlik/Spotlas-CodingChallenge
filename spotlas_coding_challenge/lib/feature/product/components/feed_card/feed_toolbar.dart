import 'package:flutter/material.dart';
import 'package:spotlas_coding_challenge/core/constants/assets/image_constants.dart';
import 'package:spotlas_coding_challenge/feature/product/components/buttons/toggle_button.dart';

class Toolbar extends StatefulWidget {
  const Toolbar({Key? key}) : super(key: key);

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconButton(ImageConstants.instance.icMap, () {}),
          _buildIconButton(ImageConstants.instance.icChatbubble, () {}),
          ToggleButton(
            onSelected: () {},
            onDeselected: () {},
            selectedImage: ImageConstants.instance.icHeartFilled,
            unselectedImage: ImageConstants.instance.icHeartEmpty,
          ),
          _buildIconButton(ImageConstants.instance.icPaperPlane, () {}),
        ],
      ),
    );
  }

  Widget _buildIconButton(String iconName, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        iconName,
        height: 24,
      ),
    );
  }
}
