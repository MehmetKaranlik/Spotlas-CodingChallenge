import 'package:flutter/material.dart';
import 'package:spotlas_coding_challenge/core/extensions/context_extensions.dart';

class DynamicVerticalSpace extends StatelessWidget {
  final ContextSpacing spacing;
  const DynamicVerticalSpace({Key? key, required this.spacing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.padding(spacing) ,
    );
  }
}