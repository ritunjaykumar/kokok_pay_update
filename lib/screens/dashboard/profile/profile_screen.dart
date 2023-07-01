import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/dashboard/profile/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileProvider>(
      create: (ctx) => ProfileProvider(context),
      child: const _ProfileScreenMain(),
    );
  }
}

///
class _ProfileScreenMain extends StatefulWidget {
  const _ProfileScreenMain({Key? key}) : super(key: key);

  @override
  State<_ProfileScreenMain> createState() => _ProfileScreenMainState();
}

class _ProfileScreenMainState extends State<_ProfileScreenMain> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        _userImageUi(),
        const SizedBox(height: 20),
        _getCardUi(),
        const SizedBox(height: 20),
        _accountDetails(),
        const SizedBox(height: 20),
        Expanded(child: _userInfoUi()),
      ],
    );
  }

  Widget _getCardUi() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    Widget getCardBody(String title, String body, [Color? descColor]) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            body,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: descColor,
            ),
          ),
          Text(title),
        ],
      );
    }

    Widget getDivider() {
      return Container(
        width: 1,
        color: Colors.grey,
        height: 50,
      );
    }

    return SizedBox(
      height: 100,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              getCardBody('KYC Update', 'Updated', Colors.green),
              getDivider(),
              getCardBody('User Type', 'Customer'),
              getDivider(),
              getCardBody('Account Type', 'Current Acc'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userInfoUi() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    Widget userInfoChildUi(IconData icon, String title, String body) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  child: Icon(
                    icon,
                    size: 19,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Text(title),
              ],
            ),
            Text(body, style: textTheme.bodyLarge)
          ],
        ),
      );
    }

    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              userInfoChildUi(Icons.calendar_month_rounded, 'Date of Birth', '17-02-1995'),
              userInfoChildUi(Icons.email_outlined, 'Email Id', 'ritunjay@gmail.com'),
              userInfoChildUi(Icons.home_outlined, 'Address', 'Laos'),
              userInfoChildUi(Icons.transgender, 'Gender', 'Male'),
              // userInfoChildUi(Icons.credit_card, 'Account type', 'Current Account'),
              userInfoChildUi(Icons.credit_card, 'Branch', 'Vientiane'),
              userInfoChildUi(Icons.account_balance, 'IFSC Code', 'IB123876'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userImageUi() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            height: 100,
            width: size.width * 0.4,
            padding: const EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              // color: colorScheme.primary,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary,
                  colorScheme.primaryContainer,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  ImagesFile.myPic,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mr. Inpone',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '+91 2052592123',
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _accountDetails() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: Card(
        elevation: 1,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Account Details'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('XXXX XXXX XXXX 4538', style: textTheme.titleMedium),
                const SizedBox(height: 5),
                Text(
                  '₭ 65,5477,378',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
