import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/dashboard/more/more_provider.dart';
import 'package:kokok_pay/screens/widgets/widget/widgets.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MoreProvider>(
      create: (ctx) => MoreProvider(context),
      child: const _MoreScreenMain(),
    );
  }
}

///
class _MoreScreenMain extends StatefulWidget {
  const _MoreScreenMain({Key? key}) : super(key: key);

  @override
  State<_MoreScreenMain> createState() => _MoreScreenMainState();
}

class _MoreScreenMainState extends State<_MoreScreenMain> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DialogAppbar(
            title: 'More',
            icon: Icons.close,
            callback: () {
              Navigator.of(context).pop();
            },
          ),
          Text('hello'),
          Text('world'),
          Text('Ritunjay'),
        ],
      ),
    );
  }
}
