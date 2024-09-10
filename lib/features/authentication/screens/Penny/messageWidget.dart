import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:saveit/utils/constants/colors.dart';

class Messagewidget extends StatefulWidget {
  const Messagewidget(
      {super.key,
      required this.loading,
      required this.text,
      required this.isFromUser});
  final String text;
  final bool isFromUser;
  final bool loading;
  @override
  State<Messagewidget> createState() => _MessagewidgetState();
}

class _MessagewidgetState extends State<Messagewidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment:
          widget.isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 282),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: widget.isFromUser ? TColors.secondary : TColors.white,
                borderRadius: widget.isFromUser
                    ? BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
              ),
              child: Column(
                children: [
                  // Only show CircularProgressIndicator if the message is not from user and is loading
                  if (!widget.isFromUser && widget.loading)
                    CircularProgressIndicator()
                  else
                    Text(
                      widget.text,
                      style: TextStyle(
                        color: widget.isFromUser
                            ? TColors.white
                            : Colors.grey.shade900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
