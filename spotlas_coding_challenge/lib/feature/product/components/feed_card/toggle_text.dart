import 'package:flutter/material.dart';
import 'package:spotlas_coding_challenge/core/extensions/context_extensions.dart';

class ToggleText extends StatefulWidget {
  const ToggleText({Key? key}) : super(key: key);

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
    return const TextSpan(
      children: [
        TextSpan(
          text: "natalievens  ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextSpan(
          text: """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
