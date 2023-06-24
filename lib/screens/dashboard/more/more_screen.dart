import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/dashboard/more/more_provider.dart';
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
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            width: double.infinity,
            height: 52,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'More',
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(
                      Icons.close,
                      color: colorScheme.primary,
                    ),
                  ),
                )
              ],
            ),
          ),
          Text('hello'),
          Text('world'),
          Text('Ritunjay'),
        ],
      ),
    );
  }
}
