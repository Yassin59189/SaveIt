import 'package:flutter/material.dart';
import 'package:saveit/utils/constants/colors.dart';

class EditWallet extends StatefulWidget {
  const EditWallet({super.key});

  @override
  State<EditWallet> createState() => _EditWalletState();
}

class _EditWalletState extends State<EditWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Wallet", style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Poppins', fontWeight: FontWeight.w600),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: TColors.primary,
        
      ),
      
      body: Container(
        
        
          color: TColors.primary,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
            child: Container(
            
              height: 600,
              
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ),
      ),
    );
  }
}