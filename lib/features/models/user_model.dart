import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String fullName;
  String email;
  String profilePicture;
  String budget;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.profilePicture,
    required this.budget,
  });

  static String generateUserName(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: '', fullName: '', email: '', profilePicture: '', budget: "0");

  /* CONVERT MODEL TO JSON */
  Map<String, dynamic> toJson() {
    return {
      'FullName': fullName,
      'Email': email,
      'ProfilePicture': profilePicture,
      'Budget': budget,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        fullName: data['FullName'] ?? '',
        email: data['Email'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        budget: data['Budget'] ?? "0",
      );
    } else {
      return UserModel.empty();
    }
  }
}
