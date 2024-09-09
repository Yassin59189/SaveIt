import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:saveit/features/models/savings_model.dart';

/// Widget that displays a carousel of saving goals
class SavingsCarousel extends StatelessWidget {
  final List<SavingGoal> savingsGoals;

  SavingsCarousel({required this.savingsGoals});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: savingsGoals.length,
      itemBuilder: (context, index, realIndex) {
        final goal = savingsGoals[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                goal.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              LinearProgressIndicator(
                value: goal.progress / goal.goalPrice,
                backgroundColor: Colors.grey[200],
                color: Colors.blue,
              ),
              SizedBox(height: 10),
              Text(
                '\$${goal.progress.toStringAsFixed(2)} / \$${goal.goalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: 200,
        viewportFraction: 0.8,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        enlargeCenterPage: true,
      ),
    );
  }
}
