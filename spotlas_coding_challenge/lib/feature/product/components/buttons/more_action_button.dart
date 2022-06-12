import 'package:flutter/material.dart';

class MoreActionButton extends StatelessWidget {
  const MoreActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: _buildButtonChild());
  }

  Widget _buildButtonChild() {
    return SizedBox(
      width: 24,
      child: Row(
        children: [
          _buildSingleDot(),
          const SizedBox(
            width: 4.8,
          ),
          _buildSingleDot(),
          const SizedBox(
            width: 4.8,
          ),
          _buildSingleDot(),
        ],
      ),
    );
  }

  Container _buildSingleDot() {
    return Container(
      width: 4.8,
      height: 4.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
