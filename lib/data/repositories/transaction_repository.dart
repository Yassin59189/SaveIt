import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saveit/features/models/transaction_model.dart';

class TransactionRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save transaction
  Future<void> saveTransaction(TransactionModel transaction) async {
    try {
      await _db
          .collection('Transactions')
          .doc(transaction.id)
          .set(transaction.toJson());
    } catch (e) {
      throw 'Failed to save transaction: $e';
    }
  }

  // Fetch user transactions
  Future<List<TransactionModel>> fetchUserTransactions(String userId) async {
    try {
      final querySnapshot = await _db
          .collection('Transactions')
          .where('UserId', isEqualTo: userId)
          .get();
      return querySnapshot.docs
          .map((doc) => TransactionModel.fromSnapshot(doc))
          .toList();
    } catch (e) {
      throw 'Failed to fetch transactions: $e';
    }
  }
}
