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

class _Penny extends State<Penny> {
  late final GenerativeModel _model;
  late ChatSession _chatSession; // Changed to non-final to allow reset
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

    // Send the system prompt once when initializing the chat session
    _sendSystemPrompt();
  }

  double Balance = 1437.0;
  double expense = 430.0;
  double Savings = 730.0;
  double Monthly = 1000;
  bool loading = false;
  Future<void> _sendSystemPrompt() async {
    final systemPrompt = '''
You are an AI model named Penny 2.0, designed to help users manage their personal finances with a focus on clarity, efficiency, and accuracy. You will receive user-specific financial data, including:

Balance: The amount of money currently in their main account, denoted as $Balance.
Monthly Income: The recurring monthly income, denoted as $Monthly. 20% of this income is automatically saved.
Savings: The user’s current savings, denoted as $Savings.
Expenses: The user’s monthly expenditures, denoted as $expense.
Currency: All amounts are in Tunisian Dinar (DT).
Your specific responsibilities are:

Budget Allocation: Whenever users inquire about spending money on non-essential items (e.g., traveling, shopping), advise them to only use their savings for these expenses. Do not allow spending from their balance for non-essential purposes.
Spending Insights: Offer concise, accurate financial advice, focusing on optimizing the user’s budget, ensuring financial goals are met.
User Interaction: Start each session by introducing yourself as Penny 2.0. Welcome the user warmly, and maintain a friendly tone throughout, incorporating emojis to enhance the user experience.
Your guidance should be brief, to the point, and actionable, prioritizing the user’s financial health by offering practical advice without delving into unnecessary detail. and always add \n in the end of your reponse
''';

    await _chatSession.sendMessage(
      Content.text(systemPrompt),
    );
  }

  Future<void> _sendChatMessage(String message) async {
    if (message.isEmpty) return; // Don't send empty messages

    setState(() {
      loading = true;
    });

    try {
      final response = await _chatSession.sendMessage(Content.text(message));
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
      _controller.clear(); // Clear input after sending
      _textFieldFocus.requestFocus(); // Focus back to the input field
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

  void _resetChatSession() {
    setState(() {
      _chatSession = _model.startChat(); // Reset chat session
      _sendSystemPrompt(); // Re-send system prompt after resetting
    });
  }

  bool switchExpenseIncom = false;
  bool inputStatus = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight * 0.91,
          decoration: const BoxDecoration(color: TColors.primary),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),
              Center(
                child: Text(
                  "Penny 2.0",
                  style: TextStyle(
                    color: TColors.white,
                    fontSize: TSizes.lg,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.7,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    repeat: ImageRepeat.repeat,
                    scale: 0.6,
                    image:
                        AssetImage("assets/images/home/bg_newTransaction.png"),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: TColors.white.withOpacity(0.8),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: _chatSession.history.length > 2
                            ? _chatSession.history.length - 2
                            : 0,
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          if (_chatSession.history.length <= 2) {
                            return Container();
                          }

                          final Content content =
                              _chatSession.history.toList()[index + 2];
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
                    )
                  ],
                ),
              ),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.08,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
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
                            color: const Color.fromRGBO(0, 0, 0, 0.15),
                            blurRadius: 2.6,
                            spreadRadius: 0,
                            offset: const Offset(1.95, 1.95),
                          ),
                        ],
                      ),
                      child: TextField(
                        onSubmitted: _sendChatMessage,
                        focusNode: _textFieldFocus,
                        controller: _controller,
                        onChanged: (value) {
                          setState(() {
                            inputStatus = value.isNotEmpty;
                          });
                        },
                        style: TextStyle(
                          fontSize: TSizes.md,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade900,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: inputStatus
                                  ? TColors.secondary
                                  : Colors.grey.shade500,
                            ),
                            onPressed: () {
                              _sendChatMessage(_controller.text);
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          hintText: "Message Penny",
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: TSizes.md,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
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
                          if (value == 'new_conversation') {
                            _resetChatSession();
                          } else if (value == 'More_settings') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile()),
                            );
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'new_conversation',
                            child: ListTile(
                              leading: Icon(Iconsax.message_add),
                              title: Text('Start new conversation'),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'More_settings',
                            child: ListTile(
                              leading: Icon(Iconsax.setting_2),
                              title: Text('More Settings'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
