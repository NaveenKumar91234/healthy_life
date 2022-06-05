import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  final String userName;
  final String password;
  final String emailId;
  const AddUser({
    Key? key,
    required this.userName,
    required this.password,
    required this.emailId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Future<void> addUser() {
      return users
          .add({
            'userName': userName,
            'password': password,
            'emailId': emailId,
          })
          .then(
            (value) => debugPrint('User Added....'),
          )
          .catchError(
            (onError) => debugPrint('Failed to create a new user : $onError'),
          );
    }

    return Center(
      child: ElevatedButton(
        child: const Text('Add New User'),
        onPressed: () {
          addUser();
        },
      ),
    );
  }
}
