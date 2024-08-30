import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/common/widgets/loaders/shimmer.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/data/repositories/transaction_repository.dart';
import 'package:saveit/features/authentication/controllers/user/transaction_controller.dart';
import 'package:saveit/features/authentication/controllers/user/user_controller.dart';
import 'package:saveit/features/authentication/screens/New_Transaction/new_transaction.dart';
import 'package:saveit/features/authentication/screens/Store/claimcode.dart';
import 'package:saveit/features/authentication/screens/home/notification_bottom_sheet/notification_bottom_sheet.dart';
import 'package:saveit/features/authentication/screens/home/wallet.dart';
import 'package:saveit/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final transactionController = Get.put(TransactionController());

    Future NotificationBottomSheet(BuildContext context) {
      return showModalBottomSheet(
          context: context,
          builder: (context) => SizedBox(
                height: 500,
                child: test(),
              ));
    }

    return Scaffold(
      endDrawer: Drawer(
        child: Expanded(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: TColors.primary,
                ),
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/images/home/logo1.png"))
                  ],
                ),
              ),
              ListTile(
                title: const Text(
                  "wallet",
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Get.to(const Wallet());
                },
              ),
              ListTile(
                title: const Text(
                  "coupon",
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Get.to(const claimcode());
                },
              ),
              ListTile(
                title: const Text(
                  "settings",
                  textAlign: TextAlign.center,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                child: Text("Logout")),
            ElevatedButton(
                onPressed: () => Get.to(NewTransaction()),
                child: Text("transaction")),
            Container(
              color: TColors.primary,
              height: 270,
              child: Column(
                children: [
                  SAppBar(
                    title: const Column(
                      children: [
                        SizedBox(
                            width: 90,
                            child: Image(
                                image: AssetImage(
                                    "assets/images/home/logo1.png"))),
                      ],
                    ),
                    actions: [
                      Builder(builder: (context) {
                        return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            icon: const Icon(
                              Iconsax.menu_14,
                              color: Colors.white,
                            ));
                      })
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Balance
                        Container(
                          width: 172,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Image(
                                    image: AssetImage(
                                        "assets/images/home/card.png")),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Your Balance",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: TColors.primary.withOpacity(0.8)),
                                ),
                                Obx(
                                  () => Text(
                                    controller.user.value.budget + "DT",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            TColors.primary.withOpacity(0.8)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        //Total
                        Container(
                          width: 172,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 9, bottom: 15, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Image(
                                    image: AssetImage(
                                        "assets/images/home/coin.png")),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Total Spend",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: TColors.primary.withOpacity(0.8)),
                                ),
                                Text(
                                  "250.000DT",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: TColors.primary.withOpacity(0.8)),
                                )
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
            const Image(image: AssetImage("assets/images/home/Vector.png")),
            const SizedBox(
              height: 20,
            ),
            //Notification
            Container(
              decoration: const BoxDecoration(
                  color: TColors.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              width: MediaQuery.of(context).size.width - 35,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 30, left: 20, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hello!",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Obx(() {
                          if (controller.profileLoading.value) {
                            return ShimmerEffect(width: 80, height: 15);
                          } else {
                            return Text(
                              controller.user.value.fullName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            );
                          }
                        }),
                      ],
                    ),
                    //Notification button
                    IconButton(
                        onPressed: () {
                          NotificationBottomSheet(context);
                        },
                        icon: const Icon(
                          Iconsax.notification5,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //History
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/home/bg.png"),
                      fit: BoxFit.cover)),
              width: MediaQuery.of(context).size.width - 35,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "History",
                        style: TextStyle(
                            color: TColors.primary,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                          child: Row(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "See all",
                                style: TextStyle(
                                    color: TColors.primary,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600),
                              )),
                          const Icon(
                            Iconsax.arrow_right_1,
                            color: TColors.primary,
                          )
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            //History content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 60,
                      mainAxisSpacing: 20),
                  itemBuilder: (_, index) => HistoryContent()),
            )
          ],
        ),
      ),
    );
  }
}

class HistoryContent extends StatelessWidget {
  HistoryContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "200DT",
                    style: TextStyle(
                        color: TColors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    'test',
                    style: TextStyle(
                        color: TColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "02/11/2022",
            style: TextStyle(
                color: TColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins'),
          )
        ],
      ),
    );
  }
}
