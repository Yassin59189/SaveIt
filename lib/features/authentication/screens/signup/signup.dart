import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:saveit/utils/constants/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children:[ Column(
                  children: [
                    Image(image: AssetImage("assets/images/login_image/signup.png")),
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi!", style: TextStyle(fontSize: 31, fontWeight: FontWeight.w500, fontFamily: 'Poppins', color: TColors.primary),),
                    Text("Register yourself!", style: TextStyle(fontSize: 31, fontWeight: FontWeight.w500, fontFamily: 'Poppins', color: TColors.primary),),
                  ],
                ),
                  ],
                )],
              ),
              //Signup title
              
              const SizedBox(height: 30,),
              //Form
              Container(
                width: MediaQuery.of(context).size.width-60,
                child: Form(child: Column(
                  children: [
                    TextFormField(
                          decoration: InputDecoration(
                            labelText: "Full name",
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))
                          ),
                        ),
                        const SizedBox(height: 15,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))
                          ),
                        ),
                        const SizedBox(height: 15,),
                        TextFormField(
                          obscureText:true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))
                          ),
                        ),
                        const SizedBox(height: 15,),
                        TextFormField(
                          obscureText:true,
                          decoration: InputDecoration(
                            labelText: "Repeat password",
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))
                          ),
                        ),
                  ],
                )),
              ),
              //Sign up button
              Container(
                        width: 214,
                        height: 56,
                        child: ElevatedButton(onPressed: (){}, child: Text("Sign up", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),), style: ElevatedButton.styleFrom(backgroundColor: TColors.primary),)),
            ],
          ),
        ),
      ),
    );
  }
}