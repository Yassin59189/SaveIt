import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:saveit/data/repositories/transaction_repository.dart';
import 'package:saveit/data/repositories/user_repository.dart';
import 'package:saveit/features/models/transaction_model.dart';
import 'package:saveit/features/models/user_model.dart';

class TransactionController extends GetxController {
  static TransactionController get instance => Get.find();

  final transactions = <TransactionModel>[].obs;
  final transactionRepository = TransactionRepository();
  final userRepository = UserRepository();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTransactions();
  }

  Future<void> fetchTransactions() async {
    isLoading.value = true;
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      transactions.value =
          await transactionRepository.fetchUserTransactions(userId);
      print("Transactions fetched: ${userId}");
    } catch (e) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    try {
      // Save the transaction first
      await transactionRepository.saveTransaction(transaction);

      // Fetch the current user data
      final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      UserModel user = await userRepository.fetchUserDetails();

      // Update the budget
      double currentBudget = double.parse(user.budget);
      if (transaction.isExpense) {
        currentBudget -= transaction.amount;
      } else {
        currentBudget += transaction.amount;
      }

      // Update user data in Firestore
      user.budget = currentBudget.toString();
      await userRepository.updateUserDetails(user);

      // Refresh transaction list
      await fetchTransactions();
    } catch (e) {
      // Handle error
    }
  }
}
