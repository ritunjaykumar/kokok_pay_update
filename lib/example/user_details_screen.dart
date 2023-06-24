import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details'),),
      body: Form(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
