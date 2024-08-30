import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String id;
  final String userId;
  final int amount;
  final String category;
  final DateTime date;
  final bool isRepeating;
  final bool isExpense; // true for expense, false for income

  TransactionModel({
    required this.id,
    required this.userId,
    required this.amount,
    required this.category,
    required this.date,
    required this.isRepeating,
    required this.isExpense,
  });

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'Amount': amount,
      'Category': category,
      'Date': date.toIso8601String(),
      'IsRepeating': isRepeating,
      'IsExpense': isExpense,
    };
  }

  factory TransactionModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TransactionModel(
      id: document.id,
      userId: data['UserId'] ?? '',
      amount: data['Amount'] ?? 0.0,
      category: data['Category'] ?? '',
      date: DateTime.parse(data['Date'] ?? DateTime.now().toIso8601String()),
      isRepeating: data['IsRepeating'] ?? true,
      isExpense: data['IsExpense'] ?? true,
    );
  }
}
