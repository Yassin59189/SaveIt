import 'package:cloud_firestore/cloud_firestore.dart';

/// Model class for saving goals
class SavingGoal {
  final String title;
  final double progress;
  final double goalPrice;

  SavingGoal({
    required this.title,
    required this.progress,
    required this.goalPrice,
  });

  /// Creates a SavingGoal instance from Firestore document
  factory SavingGoal.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return SavingGoal(
      title: data['title'],
      progress: data['progress'],
      goalPrice: data['goalPrice'],
    );
  }
}
