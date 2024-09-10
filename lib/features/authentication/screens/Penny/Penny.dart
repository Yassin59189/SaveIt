import 'dart:ffi' as ffi;
import 'dart:ui';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/features/authentication/screens/Penny/messageWidget.dart';
import 'package:saveit/features/authentication/screens/settings/profile.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Penny extends StatefulWidget {
  const Penny({super.key});
  static const double defaultSplashRadius = 10.0;

  @override
  State<Penny> createState() => _Penny();
}

double expense = 0.0;
double Income = 0.0;

bool inputStatus = false;

class _Penny extends State<Penny> {
  late final GenerativeModel _model;
  late final ChatSession _chatSession;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: "gemini-1.5-flash-latest",
      apiKey: "AIzaSyDKJbjbGpHWgKsuKcSKpQD6JmU-VYFxQsQ",
    );

    _chatSession = _model.startChat();
  }

  double Income = 330.0;
  double expense = 130.0;
  bool loading = false;
  Future<void> _sendChatMessage(String message) async {
    setState(() {
      loading = true;
    });

    try {
      // Define the system prompt to include in every message
      final systemPrompt = '''
You are an AI model named Penny 2.0, designed to help people manage their personal finances. You will receive data about users' income, expenses, and financial goals all in Tunisian Dinar (DT). Here is the data for each user:
- Income: {{$Income}}
- Expenses: {{$expense}}

Your task is to provide clear, accurate answers to their financial questions based on the information provided. Your responses should be brief, concise, and focused, aiming for high accuracy while minimizing unnecessary detail. You are known for being efficient and effective in your guidance, providing users with the most relevant financial insights in as few words as possible.
''';
      // Combine the system prompt with the user message
      final prompt = '$systemPrompt\n\nUser Question: $message';

      final response = await _chatSession.sendMessage(
        Content.text(prompt),
      );

      final text = response.text;

      if (text == null) {
        showError('No response from API.');
        return;
      }

      setState(() {
        loading = false;
        scrollDown();
      });
    } catch (e) {
      showError(e.toString());

      setState(() {
        loading = false;
      });
    } finally {
      _controller.clear();

      setState(() {
        loading = false;
      });

      _textFieldFocus.requestFocus();
    }
  }

  void scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool switchExpenseIncom = false;
  String? errorText;
  bool ExpenseButtonState = true;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: screenHeight * 0.91,
          decoration: const BoxDecoration(color: TColors.primary),
          child: Column(children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Center(
              child: Text(
                "Penny",
                style: TextStyle(
                    color: TColors.white,
                    fontSize: TSizes.lg,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    repeat: ImageRepeat.repeat,
                    scale: 0.6,
                    image:
                        AssetImage("assets/images/home/bg_newTransaction.png"),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: TColors.white.withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: _chatSession.history.length,
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          final Content content =
                              _chatSession.history.toList()[index];
                          final text = content.parts
                              .whereType<TextPart>()
                              .map((e) => e.text)
                              .join('');
                          return Messagewidget(
                              text: text,
                              isFromUser: content.role == 'user',
                              loading: loading);
                        },
                      ),
                    ),
                  ],
                )),
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: TColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: screenWidth * 0.65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            blurRadius: 2.6,
                            spreadRadius: 0,
                            offset: Offset(
                              1.95,
                              1.95,
                            ),
                          ),
                        ]),
                    child: TextField(
                        onSubmitted: _sendChatMessage,
                        focusNode: _textFieldFocus,
                        controller: _controller,
                        onChanged: (value) => {
                              setState(() {
                                value.length == 0
                                    ? inputStatus = false
                                    : inputStatus = true;
                                print(inputStatus);
                              })
                            },
                        autofocus: false,
                        style: TextStyle(
                          fontSize: TSizes.md,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade900,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Material(
                            color: Colors
                                .transparent, // Make sure the background is transparent
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                  360), // Control the shape and size of ripple
                              splashColor: Colors.grey.withOpacity(
                                  0.2), // Optional: Set a faint splash color
                              customBorder:
                                  CircleBorder(), // Defines the shape of the ripple effect
                              radius:
                                  10, // Reduce the size of the splash effect
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.all(
                                    4), // Reduce the padding around the icon
                                child: Icon(
                                  Icons.send,
                                  color: inputStatus
                                      ? TColors.secondary
                                      : Colors.grey.shade500,
                                ),
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          hintText: "Message Penny",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: TSizes.md,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                  Container(
                    width: screenWidth * 0.11,
                    height: screenWidth * 0.11,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(360),
                    ),
                    child: PopupMenuButton<String>(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.grey.shade700,
                      ),
                      onSelected: (value) {
                        setState(() {
                          value == 'new_conversation'
                              ? ""
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile()));
                        });
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'new_conversation',
                          child: ListTile(
                            leading: Icon(Icons.chat),
                            title: Text('Start new conversation'),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'More_settings',
                          child: ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('Settings'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ])),
    ));
  }
}
