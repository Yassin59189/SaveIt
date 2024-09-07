import 'package:flutter/material.dart';

import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:iconsax/iconsax.dart';

class MangeBudget extends StatefulWidget {
  const MangeBudget({super.key});

  @override
  State<MangeBudget> createState() => _MangeBudgetState();
}

class _MangeBudgetState extends State<MangeBudget> {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;
  bool active = false;
  int currentProgress = 1;
  bool SwitchVarFixed = true;
  bool SwitchDebt = true;
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: TColors.secondary, // Header background color
              onPrimary: TColors.white, // Header text color
              onSurface: TColors.primary, // Body text color
            ),
            dialogBackgroundColor: TColors.secondary
                .withOpacity(0.7), // Background color of the dialog
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectDateDebt(BuildContext context) async {
    DateTime? pickedDebt = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: TColors.secondary, // Header background color
              onPrimary: TColors.white, // Header text color
              onSurface: TColors.primary, // Body text color
            ),
            dialogBackgroundColor: TColors.secondary
                .withOpacity(0.7), // Background color of the dialog
          ),
          child: child!,
        );
      },
    );

    if (pickedDebt != null) {
      setState(() {
        _DebtDate = pickedDebt;
      });
    }
  }

  DateTime? _selectedDate;
  DateTime? _DebtDate;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SizedBox(),
        ),
        Container(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    child: Text("How much money do you currently have ?",
                        style: TextStyle(
                          fontFamily: 'popins',
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(
                              0,
                              1,
                            ),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    width: screenWidth * 0.9,
                    child: SizedBox(
                      height: screenHeight * 0.05,
                      child: TextField(
                        maxLines:
                            1, // Allows the text to wrap and expand vertically
                        minLines: 1,

                        style:
                            TextStyle(color: TColors.primary, fontSize: 13.5),

                        keyboardType: TextInputType.number,
                        cursorColor: TColors.secondary,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 12.0), // Adjust the padding

                          focusColor: TColors.secondary,
                          fillColor: TColors.secondary,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          hintText: 'Enter amount in DT ',
                          hintStyle: TextStyle(
                              color: TColors.primary.withOpacity(0.3),
                              fontSize: 13.5),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Column(
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    child: Text("Which best describes your sources of income?",
                        style: TextStyle(
                          fontFamily: 'popins',
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: TColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(
                            0,
                            1,
                          ),
                        ),
                      ],
                    ),
                    child: AnimatedToggleSwitch<bool>.size(
                        current: SwitchVarFixed,
                        values: const [true, false],
                        indicatorSize: Size.fromWidth(300),
                        customIconBuilder: (context, local, global) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: 0.9,
                                    child: Icon(
                                        color: Color.lerp(
                                            TColors.primary,
                                            TColors.white,
                                            local.animationValue),
                                        local.value
                                            ? Iconsax.money_change5
                                            : Iconsax.money_add5),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Text(
                                        local.value
                                            ? "Fixed Salary"
                                            : "My income varies ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          color: Color.lerp(
                                              TColors.primary,
                                              TColors.white,
                                              local.animationValue),
                                        ),
                                        textAlign: TextAlign.start),
                                  ),
                                ],
                              ),
                            ),
                        borderWidth: 5.0,
                        iconAnimationType: AnimationType.onHover,
                        style: ToggleStyle(
                          indicatorColor: TColors.secondary,
                          backgroundColor: TColors.white,
                          borderColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        selectedIconScale: 1.0,
                        onChanged: (value) {
                          setState(() {
                            SwitchVarFixed = value;
                          });
                        }),
                  ),

                  //=========================FIXED INCOME=============================

                  AnimatedOpacity(
                    opacity: SwitchVarFixed ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 700),
                    child: SwitchVarFixed
                        ? Container(
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(),
                            child: Column(children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 20),
                                width: screenWidth * 0.9,
                                height: screenHeight * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: TColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.16),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      offset: Offset(
                                        0,
                                        1,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Column(children: [
                                      Container(
                                        width: screenWidth * 0.8,
                                        child: Text(
                                            "How much is your Monthly fixed salary?",
                                            style: TextStyle(
                                              fontFamily: 'popins',
                                              fontSize: 12.5,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.06),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: screenWidth * 0.8,
                                        child: SizedBox(
                                          height: screenHeight * 0.05,
                                          child: TextField(
                                            maxLines:
                                                1, // Allows the text to wrap and expand vertically
                                            minLines: 1,

                                            style: TextStyle(
                                                color: TColors.primary,
                                                fontSize: 13.5),

                                            keyboardType: TextInputType.number,
                                            cursorColor: TColors.secondary,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 2.0,
                                                  horizontal:
                                                      12.0), // Adjust the padding

                                              focusColor: TColors.secondary,
                                              fillColor: TColors.secondary,
                                              border: OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                              errorStyle: TextStyle(
                                                color: Colors.red,
                                              ),
                                              hintText: 'Enter amount in DT ',
                                              hintStyle: TextStyle(
                                                  color: TColors.primary
                                                      .withOpacity(0.3),
                                                  fontSize: 13.5),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                                    //========================= Date Container=============================
                                    SizedBox(
                                      height: 10,
                                    ),

                                    Column(children: [
                                      Container(
                                        width: screenWidth * 0.8,
                                        child:
                                            Text("when was your last salary?",
                                                style: TextStyle(
                                                  fontFamily: 'popins',
                                                  fontSize: 12.5,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                      ),
                                      SizedBox(height: 8),
                                      Container(
                                          width: screenWidth * 0.8,
                                          height: screenHeight * 0.05,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.06),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextButton(
                                              onPressed: () {
                                                _selectDate(context);
                                              },
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0), // Set the desired border radius
                                                  ),
                                                ),
                                                overlayColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color?>(
                                                  (Set<MaterialState> states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .pressed)) {
                                                      return Colors.grey
                                                          .withOpacity(
                                                              0.2); // Set the color when the button is pressed
                                                    }
                                                    return null; // Defer to the widget's default color
                                                  },
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    _selectedDate ==
                                                            null //_selectedDate Hwa el date (fromat Date)
                                                        ? 'Enter The Date'
                                                        : '${_selectedDate!.month}-${_selectedDate!.day}-${_selectedDate!.year}',
                                                    style: TextStyle(
                                                      color: _selectedDate ==
                                                              null
                                                          ? Colors.grey.shade500
                                                              .withOpacity(0.6)
                                                          : TColors.primary,
                                                      fontSize: 13.5,
                                                    ),
                                                  ),
                                                  Transform.scale(
                                                    scale: 0.8,
                                                    child: Icon(
                                                        color: _selectedDate ==
                                                                null
                                                            ? Colors
                                                                .grey.shade500
                                                                .withOpacity(
                                                                    0.6)
                                                            : TColors.primary,
                                                        Iconsax.calendar5),
                                                  ),
                                                ],
                                              ))),
                                    ]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              width: screenWidth * 0.35,
                                              child: Text("do you have debt ?",
                                                  style: TextStyle(
                                                    fontFamily: 'popins',
                                                    fontSize: 12.5,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              width: screenWidth * 0.40,
                                              height: screenHeight * 0.05,
                                              decoration: BoxDecoration(),
                                              child: AnimatedToggleSwitch<
                                                      bool>.size(
                                                  current: SwitchDebt,
                                                  values: const [true, false],
                                                  indicatorSize:
                                                      Size.fromWidth(70),
                                                  customIconBuilder: (context,
                                                          local, global) =>
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        4.0),
                                                            child: Text(
                                                                local.value
                                                                    ? "No"
                                                                    : "yes ",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 13,
                                                                  color: Color.lerp(
                                                                      TColors
                                                                          .primary,
                                                                      TColors
                                                                          .white,
                                                                      local
                                                                          .animationValue),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                          ),
                                                        ],
                                                      ),
                                                  borderWidth: 5.0,
                                                  iconAnimationType:
                                                      AnimationType.onHover,
                                                  style: ToggleStyle(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.16),
                                                        blurRadius: 4,
                                                        spreadRadius: 0,
                                                        offset: Offset(
                                                          0,
                                                          1,
                                                        ),
                                                      )
                                                    ],
                                                    indicatorColor:
                                                        TColors.secondary,
                                                    backgroundColor:
                                                        Colors.white,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  selectedIconScale: 1.0,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      SwitchDebt = value;
                                                    });
                                                  }),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: screenWidth * 0.4,
                                              decoration: BoxDecoration(),
                                              child: AnimatedOpacity(
                                                opacity:
                                                    !SwitchDebt ? 1.0 : 0.0,
                                                duration:
                                                    Duration(milliseconds: 700),
                                                child: !SwitchDebt
                                                    ? Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            width: screenWidth *
                                                                0.4,
                                                            child: Text(
                                                                "What's your monthly payment ?",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'popins',
                                                                  fontSize:
                                                                      11.2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                )),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.06),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            width: screenWidth *
                                                                0.9,
                                                            child: SizedBox(
                                                              height:
                                                                  screenHeight *
                                                                      0.05,
                                                              child: TextField(
                                                                maxLines:
                                                                    1, // Allows the text to wrap and expand vertically
                                                                minLines: 1,

                                                                style: TextStyle(
                                                                    color: TColors
                                                                        .primary,
                                                                    fontSize:
                                                                        13.5),

                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                cursorColor:
                                                                    TColors
                                                                        .secondary,
                                                                decoration:
                                                                    InputDecoration(
                                                                  contentPadding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          2.0,
                                                                      horizontal:
                                                                          12.0), // Adjust the padding

                                                                  focusColor:
                                                                      TColors
                                                                          .secondary,
                                                                  fillColor: TColors
                                                                      .secondary,
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.transparent),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.transparent),
                                                                  ),
                                                                  errorStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  hintText:
                                                                      'Enter amount in DT ',
                                                                  hintStyle: TextStyle(
                                                                      color: TColors
                                                                          .primary
                                                                          .withOpacity(
                                                                              0.3),
                                                                      fontSize:
                                                                          13.5),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox.shrink(),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: AnimatedOpacity(
                                        opacity: !SwitchDebt ? 1.0 : 0.0,
                                        duration: Duration(milliseconds: 700),
                                        child: !SwitchDebt
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          width:
                                                              screenWidth * 0.4,
                                                          child: Text(
                                                              "How many Months left ",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'popins',
                                                                fontSize: 11.2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              )),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.06),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          width: screenWidth *
                                                              0.35,
                                                          child: SizedBox(
                                                            height:
                                                                screenHeight *
                                                                    0.05,
                                                            child: TextField(
                                                              maxLines:
                                                                  1, // Allows the text to wrap and expand vertically
                                                              minLines: 1,

                                                              style: TextStyle(
                                                                  color: TColors
                                                                      .primary,
                                                                  fontSize:
                                                                      13.5),

                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              cursorColor:
                                                                  TColors
                                                                      .secondary,
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        vertical:
                                                                            2.0,
                                                                        horizontal:
                                                                            12.0), // Adjust the padding

                                                                focusColor: TColors
                                                                    .secondary,
                                                                fillColor: TColors
                                                                    .secondary,
                                                                border:
                                                                    OutlineInputBorder(),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.transparent),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.transparent),
                                                                ),
                                                                errorStyle:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                                hintText:
                                                                    'Enter Months  ',
                                                                hintStyle: TextStyle(
                                                                    color: TColors
                                                                        .primary
                                                                        .withOpacity(
                                                                            0.3),
                                                                    fontSize:
                                                                        13.5),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                  Column(children: [
                                                    Container(
                                                      width: screenWidth * 0.4,
                                                      child: Text(
                                                          " payment day",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'popins',
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          )),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Container(
                                                        width:
                                                            screenWidth * 0.4,
                                                        height:
                                                            screenHeight * 0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.06),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: TextButton(
                                                            onPressed: () {
                                                              _selectDateDebt(
                                                                  context);
                                                            },
                                                            style: ButtonStyle(
                                                              shape: MaterialStateProperty
                                                                  .all<
                                                                      RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0), // Set the desired border radius
                                                                ),
                                                              ),
                                                              overlayColor:
                                                                  MaterialStateProperty
                                                                      .resolveWith<
                                                                          Color?>(
                                                                (Set<MaterialState>
                                                                    states) {
                                                                  if (states.contains(
                                                                      MaterialState
                                                                          .pressed)) {
                                                                    return Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.2); // Set the color when the button is pressed
                                                                  }
                                                                  return null; // Defer to the widget's default color
                                                                },
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  _DebtDate ==
                                                                          null // _DebtDate Hwa el date (fromat Date)
                                                                      ? 'Enter The Date'
                                                                      : '${_DebtDate!.month}-${_DebtDate!.day}-${_DebtDate!.year}',
                                                                  style:
                                                                      TextStyle(
                                                                    color: _DebtDate ==
                                                                            null
                                                                        ? Colors
                                                                            .grey
                                                                            .shade500
                                                                            .withOpacity(
                                                                                0.6)
                                                                        : TColors
                                                                            .primary,
                                                                    fontSize:
                                                                        13.5,
                                                                  ),
                                                                ),
                                                                Transform.scale(
                                                                  scale: 0.8,
                                                                  child: Icon(
                                                                      color: _DebtDate ==
                                                                              null
                                                                          ? Colors
                                                                              .grey
                                                                              .shade500
                                                                              .withOpacity(
                                                                                  0.6)
                                                                          : TColors
                                                                              .primary,
                                                                      Iconsax
                                                                          .calendar5),
                                                                ),
                                                              ],
                                                            ))),
                                                  ]),
                                                ],
                                              )
                                            : SizedBox.shrink(),
                                      ),
                                    )
                                  ],
                                ),
                                //========================= Date  container Done ============================= ])) ],
                              )
                            ]))
                        : SizedBox.shrink(),
                  ),
                  AnimatedOpacity(
                    opacity: !SwitchVarFixed ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 700),
                    child: !SwitchVarFixed
                        ? Container(
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(),
                            child: Column(children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 20),
                                width: screenWidth * 0.9,
                                height: screenHeight * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: TColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.16),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      offset: Offset(
                                        0,
                                        1,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Column(children: [
                                      Container(
                                        width: screenWidth * 0.8,
                                        child: Text(
                                            "How much usually is your Monthly income?",
                                            style: TextStyle(
                                              fontFamily: 'popins',
                                              fontSize: 12.5,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.06),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: screenWidth * 0.8,
                                        child: SizedBox(
                                          height: screenHeight * 0.05,
                                          child: TextField(
                                            maxLines:
                                                1, // Allows the text to wrap and expand vertically
                                            minLines: 1,

                                            style: TextStyle(
                                                color: TColors.primary,
                                                fontSize: 13.5),

                                            keyboardType: TextInputType.number,
                                            cursorColor: TColors.secondary,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 2.0,
                                                  horizontal:
                                                      12.0), // Adjust the padding

                                              focusColor: TColors.secondary,
                                              fillColor: TColors.secondary,
                                              border: OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                              errorStyle: TextStyle(
                                                color: Colors.red,
                                              ),
                                              hintText: 'Enter amount in DT ',
                                              hintStyle: TextStyle(
                                                  color: TColors.primary
                                                      .withOpacity(0.3),
                                                  fontSize: 13.5),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                                    //========================= Date Container=============================
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(children: [
                                      Container(
                                        width: screenWidth * 0.8,
                                        child: Text(
                                            "How many source of income you have ?",
                                            style: TextStyle(
                                              fontFamily: 'popins',
                                              fontSize: 12.5,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.06),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: screenWidth * 0.8,
                                        child: SizedBox(
                                          height: screenHeight * 0.05,
                                          child: TextField(
                                            maxLines:
                                                1, // Allows the text to wrap and expand vertically
                                            minLines: 1,

                                            style: TextStyle(
                                                color: TColors.primary,
                                                fontSize: 13.5),

                                            keyboardType: TextInputType.number,
                                            cursorColor: TColors.secondary,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 2.0,
                                                  horizontal:
                                                      12.0), // Adjust the padding

                                              focusColor: TColors.secondary,
                                              fillColor: TColors.secondary,
                                              border: OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                              errorStyle: TextStyle(
                                                color: Colors.red,
                                              ),
                                              hintText:
                                                  'Enter Number of sources ',
                                              hintStyle: TextStyle(
                                                  color: TColors.primary
                                                      .withOpacity(0.3),
                                                  fontSize: 13.5),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),

                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              width: screenWidth * 0.35,
                                              child: Text("do you have debt ?",
                                                  style: TextStyle(
                                                    fontFamily: 'popins',
                                                    fontSize: 12.5,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              width: screenWidth * 0.40,
                                              height: screenHeight * 0.05,
                                              decoration: BoxDecoration(),
                                              child: AnimatedToggleSwitch<
                                                      bool>.size(
                                                  current: SwitchDebt,
                                                  values: const [true, false],
                                                  indicatorSize:
                                                      Size.fromWidth(70),
                                                  customIconBuilder: (context,
                                                          local, global) =>
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        4.0),
                                                            child: Text(
                                                                local.value
                                                                    ? "No"
                                                                    : "yes ",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 13,
                                                                  color: Color.lerp(
                                                                      TColors
                                                                          .primary,
                                                                      TColors
                                                                          .white,
                                                                      local
                                                                          .animationValue),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                          ),
                                                        ],
                                                      ),
                                                  borderWidth: 5.0,
                                                  iconAnimationType:
                                                      AnimationType.onHover,
                                                  style: ToggleStyle(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.16),
                                                        blurRadius: 4,
                                                        spreadRadius: 0,
                                                        offset: Offset(
                                                          0,
                                                          1,
                                                        ),
                                                      )
                                                    ],
                                                    indicatorColor:
                                                        TColors.secondary,
                                                    backgroundColor:
                                                        Colors.white,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  selectedIconScale: 1.0,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      SwitchDebt = value;
                                                    });
                                                  }),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: screenWidth * 0.4,
                                              decoration: BoxDecoration(),
                                              child: AnimatedOpacity(
                                                opacity:
                                                    !SwitchDebt ? 1.0 : 0.0,
                                                duration:
                                                    Duration(milliseconds: 700),
                                                child: !SwitchDebt
                                                    ? Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            width: screenWidth *
                                                                0.4,
                                                            child: Text(
                                                                "What's your monthly payment ?",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'popins',
                                                                  fontSize:
                                                                      11.2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                )),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.06),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            width: screenWidth *
                                                                0.9,
                                                            child: SizedBox(
                                                              height:
                                                                  screenHeight *
                                                                      0.05,
                                                              child: TextField(
                                                                maxLines:
                                                                    1, // Allows the text to wrap and expand vertically
                                                                minLines: 1,

                                                                style: TextStyle(
                                                                    color: TColors
                                                                        .primary,
                                                                    fontSize:
                                                                        13.5),

                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                cursorColor:
                                                                    TColors
                                                                        .secondary,
                                                                decoration:
                                                                    InputDecoration(
                                                                  contentPadding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          2.0,
                                                                      horizontal:
                                                                          12.0), // Adjust the padding

                                                                  focusColor:
                                                                      TColors
                                                                          .secondary,
                                                                  fillColor: TColors
                                                                      .secondary,
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.transparent),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.transparent),
                                                                  ),
                                                                  errorStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  hintText:
                                                                      'Enter amount in DT ',
                                                                  hintStyle: TextStyle(
                                                                      color: TColors
                                                                          .primary
                                                                          .withOpacity(
                                                                              0.3),
                                                                      fontSize:
                                                                          13.5),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox.shrink(),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: AnimatedOpacity(
                                        opacity: !SwitchDebt ? 1.0 : 0.0,
                                        duration: Duration(milliseconds: 700),
                                        child: !SwitchDebt
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          width:
                                                              screenWidth * 0.4,
                                                          child: Text(
                                                              "How many Months left ",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'popins',
                                                                fontSize: 11.2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              )),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.06),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          width: screenWidth *
                                                              0.35,
                                                          child: SizedBox(
                                                            height:
                                                                screenHeight *
                                                                    0.05,
                                                            child: TextField(
                                                              maxLines:
                                                                  1, // Allows the text to wrap and expand vertically
                                                              minLines: 1,

                                                              style: TextStyle(
                                                                  color: TColors
                                                                      .primary,
                                                                  fontSize:
                                                                      13.5),

                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              cursorColor:
                                                                  TColors
                                                                      .secondary,
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        vertical:
                                                                            2.0,
                                                                        horizontal:
                                                                            12.0), // Adjust the padding

                                                                focusColor: TColors
                                                                    .secondary,
                                                                fillColor: TColors
                                                                    .secondary,
                                                                border:
                                                                    OutlineInputBorder(),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.transparent),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.transparent),
                                                                ),
                                                                errorStyle:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                                hintText:
                                                                    'Enter Months  ',
                                                                hintStyle: TextStyle(
                                                                    color: TColors
                                                                        .primary
                                                                        .withOpacity(
                                                                            0.3),
                                                                    fontSize:
                                                                        13.5),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                  Column(children: [
                                                    Container(
                                                      width: screenWidth * 0.4,
                                                      child: Text(
                                                          " payment day",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'popins',
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          )),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Container(
                                                        width:
                                                            screenWidth * 0.4,
                                                        height:
                                                            screenHeight * 0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.06),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: TextButton(
                                                            onPressed: () {
                                                              _selectDateDebt(
                                                                  context);
                                                            },
                                                            style: ButtonStyle(
                                                              shape: MaterialStateProperty
                                                                  .all<
                                                                      RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0), // Set the desired border radius
                                                                ),
                                                              ),
                                                              overlayColor:
                                                                  MaterialStateProperty
                                                                      .resolveWith<
                                                                          Color?>(
                                                                (Set<MaterialState>
                                                                    states) {
                                                                  if (states.contains(
                                                                      MaterialState
                                                                          .pressed)) {
                                                                    return Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.2); // Set the color when the button is pressed
                                                                  }
                                                                  return null; // Defer to the widget's default color
                                                                },
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  _DebtDate ==
                                                                          null // _DebtDate Hwa el date (fromat Date)
                                                                      ? 'Enter The Date'
                                                                      : '${_DebtDate!.month}-${_DebtDate!.day}-${_DebtDate!.year}',
                                                                  style:
                                                                      TextStyle(
                                                                    color: _DebtDate ==
                                                                            null
                                                                        ? Colors
                                                                            .grey
                                                                            .shade500
                                                                            .withOpacity(
                                                                                0.6)
                                                                        : TColors
                                                                            .primary,
                                                                    fontSize:
                                                                        13.5,
                                                                  ),
                                                                ),
                                                                Transform.scale(
                                                                  scale: 0.8,
                                                                  child: Icon(
                                                                      color: _DebtDate ==
                                                                              null
                                                                          ? Colors
                                                                              .grey
                                                                              .shade500
                                                                              .withOpacity(
                                                                                  0.6)
                                                                          : TColors
                                                                              .primary,
                                                                      Iconsax
                                                                          .calendar5),
                                                                ),
                                                              ],
                                                            ))),
                                                  ]),
                                                ],
                                              )
                                            : SizedBox.shrink(),
                                      ),
                                    )
                                  ],
                                ),
                                //========================= Date  container Done ============================= ])) ],
                              )
                            ]))
                        : SizedBox.shrink(),
                  ),
                ],
              ),

              //=========================FIXED INCOME=============================
            ],
          ),
        ),
      ],
    )));
  }
}
