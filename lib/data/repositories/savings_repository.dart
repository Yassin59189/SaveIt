import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saveit/features/models/savings_model.dart';

/// Fetches a list of saving goals for a specific user from Firestore
Future<List<SavingGoal>> fetchSavingGoals(String userId) async {
  final querySnapshot = await FirebaseFirestore.instance
      .collection('savings')
      .doc(userId)
      .collection('goals')
      .get();

  return querySnapshot.docs
      .map((doc) => SavingGoal.fromFirestore(doc))
      .toList();
}

/// Adds a new saving goal to Firestore
Future<void> addSavingGoal(String userId, SavingGoal goal) async {
  await FirebaseFirestore.instance
      .collection('savings')
      .doc(userId)
      .collection('goals')
      .add({
    'title': goal.title,
    'progress': goal.progress,
    'goalPrice': goal.goalPrice,
  });
}
