import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saveit/features/authentication/screens/Store/claimcode.dart';
import 'package:saveit/features/authentication/screens/home/wallet.dart';
import 'package:saveit/utils/constants/colors.dart';

class EditWallet extends StatefulWidget {
  const EditWallet({super.key});

  @override
  State<EditWallet> createState() => _EditWalletState();
  
}

class _EditWalletState extends State<EditWallet> {
    String dropdownValue='New Purchase';
    List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Wallet", style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Poppins', fontWeight: FontWeight.w600),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: TColors.primary,
        
      ),
      
      body: Container(
        
        
          color: TColors.primary,
          height: screenHeight,
          width: screenWidth,
        
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
            child: Container(
              
              height: screenHeight*0.8,
              
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Form(child: 
                  Column(
                    children: [
                      //Dropdown Menu
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Container(
                          width: screenWidth*.75,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: TColors.secondary,
                              width: 1
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(value: dropdownValue, icon: const Icon(Icons.add_circle_outline, color: TColors.secondary,),
                              style: const TextStyle(color: TColors.secondary),
                              onChanged: (String? newValue){
                                setState(() {
                                  dropdownValue=newValue!;
                                });
                              },
                              items: const [
                                DropdownMenuItem<String>(
                                  value: 'New Purchase',
                                  child: Text("New Purchase"),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'test1',
                                  child: Text("test1"),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'test2',
                                  child: Text("test2"),
                                ),
                              ],),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60,),
                        //Add new purchase
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Date
                              Container(
                                width: screenWidth*0.4,
                                height: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Date",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(color: TColors.secondary, width: 1)
                                    ),
                                    
                                  ),
                                ),
                              ),
                              //Cost
                              Container(
                                width: screenWidth*0.3,
                                height: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Cost(DT)",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(color: TColors.secondary, width: 1)
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        //Purchase type
                        Center(
                          child: toggle(isSelected),
                        ),
                        const SizedBox(height: 50,),
                        //Save button
                        Container(
                          width: screenWidth*0.5,
                          height: screenHeight*0.05,
                          child: ElevatedButton(onPressed: (){}, child: Text("SAVE", style: TextStyle(color: Colors.white, fontFamily: 'Nunito', fontSize: 20, fontWeight: FontWeight.w800, letterSpacing: 5),),
                          style: ElevatedButton.styleFrom(backgroundColor: TColors.secondary, shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),),  
                        ),
                        const SizedBox(height: 10,),
                        //Image
                        Image(image: AssetImage("assets/images/home/wallet.png"))
                ]
                ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ToggleButtons toggle(List<bool> isSelected) {
    return ToggleButtons(
                          borderColor: TColors.secondary,
                          selectedColor: Colors.white,
                          fillColor: TColors.secondary,
                          color: TColors.secondary,
                          constraints: BoxConstraints(minHeight: 30.0, minWidth: 140.0),
                          borderRadius: BorderRadius.circular(5.0),
                          children: const
                        [Text("Regular"),
                        Text("Once")],
                        isSelected: isSelected,
                        onPressed: (int index){
                          setState(() {
                            for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                          }
                          });
                        },
                        );
  }
}