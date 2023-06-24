
import 'package:flutter/material.dart';
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
  final theme = Theme.of(context);
    return Column(
      children: [
        Text('profile screen')
      ],
    );
  }
}
