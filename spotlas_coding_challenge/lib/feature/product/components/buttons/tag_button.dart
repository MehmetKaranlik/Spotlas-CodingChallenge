import 'package:flutter/material.dart';

class TagButton extends StatelessWidget {
  final String buttonTitle;
  const TagButton({Key? key, required this.buttonTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: _buildStyle(),
      child: Text(
        buttonTitle,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  ButtonStyle _buildStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      shadowColor: MaterialStateProperty.all<Color>(Colors.black.withOpacity(1)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
