import 'package:flutter/material.dart';
import 'package:spotlas_coding_challenge/core/extensions/context_extensions.dart';

class ToggleText extends StatefulWidget {
  final String authorName;
  final String caption;
  const ToggleText({
    Key? key,
    required this.authorName,
    required this.caption,
  }) : super(key: key);

  @override
  State<ToggleText> createState() => _ToggleTextState();
}

class _ToggleTextState extends State<ToggleText> {
  int maximumNumberOfLines = 3;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _expandLine();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: context.padding(ContextSpacing.small)),
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: _buildBody(),
        ),
      ),
    );
  }

  Row _buildBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: RichText(
            maxLines: maximumNumberOfLines,
            overflow: TextOverflow.ellipsis,
            text: _buildUserTag(),
          ),
        ),
      ],
    );
  }

  void _expandLine() {
    if (maximumNumberOfLines == 3) {
      setState(() {
        maximumNumberOfLines = 20;
      });
    } else {
      setState(() {
        maximumNumberOfLines = 3;
      });
    }
  }

  TextSpan _buildUserTag() {
    return TextSpan(
      children: [
        TextSpan(
          text: "${widget.authorName}  ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextSpan(
          text: widget.caption,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
