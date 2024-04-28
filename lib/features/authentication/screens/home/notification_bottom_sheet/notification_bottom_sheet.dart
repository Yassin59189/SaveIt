 import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
  class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Notification")),
        actions: [Icon(Iconsax.more)],
      ),
    );
  }
}