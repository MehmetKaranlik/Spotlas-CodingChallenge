import 'package:flutter/material.dart';
import 'package:spotlas_coding_challenge/core/extensions/context_extensions.dart';

class DynamicHorizontalSpace extends StatelessWidget {
  final ContextSpacing spacing;
  const DynamicHorizontalSpace({Key? key, required this.spacing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.padding(spacing),
    );
  }
}
