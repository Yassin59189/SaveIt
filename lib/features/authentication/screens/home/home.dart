import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/features/authentication/screens/home/notification_bottom_sheet/notification_bottom_sheet.dart';
import 'package:saveit/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future NotificationBottomSheet(BuildContext context){
    return showModalBottomSheet(context: context,
    builder: (context) => Container(
      height: 200,
      child: test(),
    ));
  }
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: TColors.primary,
              height: 270,
              child: Column(
                children: [
                  SAppBar(
                    title: Column(
                      children: [
                        Container( width: 90, child: Image(image: AssetImage("assets/images/home/logo1.png"))),
                        
                      ],
                    ),
                    actions: [
                      IconButton(onPressed: (){}, icon: const Icon(Iconsax.menu_14, color: Colors.white,))
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Balance
                        Container(
                          width: 172,
                          
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(image: AssetImage("assets/images/home/card.png")),
                                SizedBox(height: 10,),
                                Text("Your Balance", style: TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w500, color: TColors.primary.withOpacity(0.8)),),
                                Text("450.000DT", style: TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w500, color: TColors.primary.withOpacity(0.8)),)
                              ],
                            ),
                          ),
                        ),
                        //Total
                        Container(
                          width: 172,
                          
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 9, bottom: 15, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(image: AssetImage("assets/images/home/coin.png")),
                                SizedBox(height: 10,),
                                Text("Total Spend", style: TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w500, color: TColors.primary.withOpacity(0.8)),),
                                Text("250.000DT", style: TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w500, color: TColors.primary.withOpacity(0.8)),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              
              ),
              
            ),
            Image(image: AssetImage("assets/images/home/Vector.png")),
            const SizedBox(height: 20,),
            //Notification
            Container(
              decoration: BoxDecoration(
                            color: TColors.secondary,
                            borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
              width: MediaQuery.of(context).size.width-35,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello!", style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w700),),
                        Text("Yassin Ben Mosbeh", style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w500),),
                      ],
                    ),
                    //Notification button
                    IconButton(onPressed: (){
                      NotificationBottomSheet(context);}, icon: Icon(Iconsax.notification5, color: Colors.white,))
                    
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            //History
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/home/bg.png"), fit: BoxFit.cover)
              ),
              
              width: MediaQuery.of(context).size.width-35,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("History", style: TextStyle(color: TColors.primary, fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w600),),
                      Container(child: Row(
                        children: [
                          TextButton(onPressed: (){}, child: Text("See all", style: TextStyle(color: TColors.primary, fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w600),)),
                          Icon(Iconsax.arrow_right_1, color: TColors.primary,)
                  
                        ],
                      )
                      ),
                    
                    ],
                  ),
                  const SizedBox(height: 10,),
                
                
                ],
              ),
              
            ),
            //History content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, mainAxisExtent: 60, mainAxisSpacing: 20), itemBuilder: (_, index) => HistoryContent()
                    ),
                )
            
          ],
          
        ),
        
      ),
    );
  }
}

class HistoryContent extends StatelessWidget {
  const HistoryContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(image: AssetImage("assets/icons/history.png")),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lorem Ipsum", style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w400),),
                  Text("Yesterday 19:12", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF999999)),)
                ],
              )
            ],
          ),
          Text("-10.000DT",style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF999999)))
        ],
      ),
    );
  }
  
}

