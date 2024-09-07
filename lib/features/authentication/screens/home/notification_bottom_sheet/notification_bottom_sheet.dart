import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/features/authentication/screens/home/notification_bottom_sheet/notification_data.dart';
import 'package:saveit/utils/constants/colors.dart';

class test extends StatelessWidget {
  test({super.key});
  List<notification> notifications = List.of(data.notifications);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: TColors.primary,
          surfaceTintColor: TColors.secondary,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                Transform.translate(
                  offset: Offset(-10, 0),
                  child: Text(
                    "Notification",
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert_outlined),
                )
              ],
            ),
          ),
        ),
        body: ListView.separated(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Slidable(
                startActionPane: ActionPane(
                  motion: const BehindMotion(),
                  children: [
                    SlidableAction(
                      icon: Iconsax.receipt_add,
                      onPressed: (context) {},
                      backgroundColor: const Color(0xFF5469D4),
                    )
                  ],
                ),
                endActionPane:
                    ActionPane(motion: const BehindMotion(), children: [
                  SlidableAction(
                    onPressed: (context) {},
                    icon: Iconsax.box,
                    backgroundColor: const Color(0xFF3C4257),
                  )
                ]),
                child: listTile(index));
          },
          separatorBuilder: (context, index) => const Divider(),
        ));
  }

  Widget listTile(int index) {
    return ListTile(
      title: Text(notifications[index].description!),
      subtitle: Text(notifications[index].date!),
    );
  }
}
