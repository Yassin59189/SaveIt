import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:typewritertext/typewritertext.dart';

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
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  constraints: const BoxConstraints(maxWidth: 282),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color:
                        widget.isFromUser ? TColors.secondary : TColors.white,
                    borderRadius: widget.isFromUser
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )
                        : const BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                  ),
                  child: Column(
                    children: [
                      // Show a loading spinner if it's not from the user and is still loading

                      // Use typewriter animation for non-user messages
                      widget.isFromUser
                          ? Text(
                              widget.text,
                              style: TextStyle(
                                color: widget.isFromUser
                                    ? TColors.white
                                    : Colors.grey.shade900,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : TypeWriterText(
                              text: Text(
                                widget.text + "\n",
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              duration: const Duration(milliseconds: 10),
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
