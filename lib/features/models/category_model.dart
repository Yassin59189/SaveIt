import 'package:flutter/material.dart';

class CategoryModel {
  final String id; // Unique ID for the category
  final String name;
  final bool priority;
  final IconData icon;
  final double amount; // Adjust this based on your needs

  CategoryModel({
    required this.id,
    required this.name,
    required this.priority,
    required this.icon,
    required this.amount,
  });

  // Convert a CategoryModel into a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'priority': priority,
      'icon': icon.codePoint, // Convert IconData to codePoint
      'amount': amount,
    };
  }

  // Create a CategoryModel from a Map
  factory CategoryModel.fromMap(String id, Map<String, dynamic> map) {
    return CategoryModel(
      id: id,
      name: map['name'],
      priority: map['priority'],
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
      amount: map['amount'],
    );
  }
}
