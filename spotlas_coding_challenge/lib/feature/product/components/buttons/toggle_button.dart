import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final VoidCallback onSelected;
  final VoidCallback onDeselected;
  final String selectedImage;
  final String unselectedImage;
  final bool? isSelected;
  const ToggleButton({
    Key? key,
    required this.onSelected,
    required this.onDeselected,
    required this.selectedImage,
    required this.unselectedImage,
    this.isSelected,
  }) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  late bool isSelected;

  @override
  void initState() {
    isSelected = widget.isSelected ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          isSelected ? widget.onDeselected() : widget.onSelected();
          _changeState();
        },
        icon: Image.asset(
          isSelected ? widget.selectedImage : widget.unselectedImage,
          color: isSelected ? Colors.yellow : null,
          height: 24,
        ));
  }

  void _changeState() {
    setState(() {
      isSelected = !isSelected;
    });
  }
}
