import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class question1 extends StatelessWidget {
  const question1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SizedBox(
                    height: THelperFunctions.screenHeight()*0.15,
                  ),
          IconButton(onPressed:(){}, icon: Icon(Icons.arrow_back_rounded)),
          PageView(
            children: [
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: THelperFunctions.screenWidth() * 0.8,
                    child: const Text(
                      TText.question1_headline,
                      style: TextStyle(fontFamily:"poppins", fontWeight: FontWeight.w600, fontSize: TSizes.fontSm,color:TColors.primary),textAlign: TextAlign.center,),),
                  SizedBox(
                    height: TSizes.spaceBtsections,
                  ),
                  SizedBox(
                  child:ElevatedButton(
                    onPressed:() {},
                    style: buttonquestions,
                    child: Text(TText.answers,style:TextStyle(color:TColors.white ),))),
                  SizedBox(
                    height: TSizes.spaceBtwitems,
                  ),
                  SizedBox(
                  child:ElevatedButton(
                    onPressed:() {},
                    style: buttonquestions,
                    child: Text(TText.answers,style:TextStyle(color:TColors.white ),))),
                  SizedBox(
                    height: TSizes.spaceBtwitems,
                  ),
                  SizedBox(
                  child:ElevatedButton(
                    onPressed:() {},
                    style: buttonquestions,
                    child: Text(TText.answers,style:TextStyle(color:TColors.white ),))),
                  SizedBox(
                    height: TSizes.spaceBtwitems,
                  ),
                  SizedBox(
                  child:ElevatedButton(
                    onPressed:() {},
                    style: buttonquestions,
                    child: Text(TText.answers,style:TextStyle(color:TColors.white ),))),
                  SizedBox(
                    height: TSizes.spaceBtwitems,
                  ),
                  SizedBox(
                  child:ElevatedButton(
                    onPressed:() {},
                    style: buttonquestions,
                    child: Text(TText.answers,style:TextStyle(color:TColors.white ),))),
                   SizedBox(
                    height: TSizes.spaceBtsections,
                  ),
                  SizedBox(
                  child:ElevatedButton(
                  onPressed:() {},
                  style: buttonanContinueSecondary,
                  child: Text(TText.answers,style:TextStyle(color:TColors.white ),))),
                
                ],
              )
            ],
          )
      
        ],),
    );
  }
}