import 'package:flutter/material.dart';
import 'package:saveit/utils/constants/colors.dart';

class CodeVerifyScreen extends StatelessWidget {
  const CodeVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column( 
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Phone", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, fontFamily: 'Poppins', color: TColors.primary),),
                          Text("Registration", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, fontFamily: 'Poppins', color: TColors.primary),)
                        ],
                      ),
                      const SizedBox(height: 40,),
                      Container(
                        width: 244,
                        child: Text('Le lorem ipsum est en imprimerie une suite Le lorem '))
                    ],
                  ),
                  Image(image: AssetImage("assets/images/login_image/phone.png"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}