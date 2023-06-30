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
      create: (ctx) => MoreProvider(context)..init(),
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
    List<MenuItemData> menuItems = context.read<MoreProvider>().menuItems;
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
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              scrollDirection: Axis.horizontal,
              itemCount: menuItems.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                // crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
                maxCrossAxisExtent: 200,
              ),
              itemBuilder: (ctx, i) {
                final menuItem = menuItems[i];
                return _MenuItem(menuItem: menuItem);
              },
            ),
          )

        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({super.key, required this.menuItem});

  final MenuItemData menuItem;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(8),
      /*width: 100,
      height: 90,*/
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: menuItem.path == null
            ? null
            : () {

          Navigator.of(context).pushReplacementNamed(menuItem.path!);
        },
        borderRadius: BorderRadius.circular(16),
        splashColor: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: colorScheme.onPrimary,
              child: Icon(
                menuItem.icon,
                color: colorScheme.primary,
              ),
            ),
            FittedBox(
              child: Text(
                menuItem.title,
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
