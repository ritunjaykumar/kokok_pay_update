import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/resources/size_manager.dart';
import '/resources/string_manager.dart';
import '/screens/before/update/update_provider.dart';
import '/screens/widgets/common/bank_logo.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => UpdateProvider(context),
      child: const _UpdateScreenMain(),
    );
  }
}

//==
class _UpdateScreenMain extends StatefulWidget {
  const _UpdateScreenMain({Key? key}) : super(key: key);

  @override
  State<_UpdateScreenMain> createState() => _UpdateScreenMainState();
}

class _UpdateScreenMainState extends State<_UpdateScreenMain> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(SizeResource.value_16),
        child: Column(
          children: [
            Container(
              width: SizeResource.value_120,
              height: SizeResource.value_120,
              padding: const EdgeInsets.all(
                SizeResource.value_8,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(
                  SizeResource.value_12,
                ),
              ),
              child: const BankLogo(),
            ),
            const SizedBox(height: SizeResource.value_12),
            Text(
              'Update App',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.background,
              ),
            ),
            const SizedBox(height: SizeResource.value_8),
            Text(
              'new version: 1.0.12',
              style: theme.textTheme.labelLarge!.copyWith(
                color: theme.colorScheme.background,
              ),
            ),
            const SizedBox(height: SizeResource.value_12),
            Text(
              StringResource().updateMsg,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.background,
              ),
            ),
            const SizedBox(height: SizeResource.value_16),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, i) => const _UpdateItem('KOKKOK Mart QR Payment'),
                itemCount: 10,
              ),
            ),
            const SizedBox(height: SizeResource.value_16),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary.withOpacity(.7),
                    ),
                    child: const Text('Update Now'),
                  ),
                ),
                const SizedBox(height: SizeResource.value_12),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.background,
                    ),
                    child: const Text('Update Later'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _UpdateItem extends StatelessWidget {
  const _UpdateItem(this.updateName, {Key? key}) : super(key: key);
  final String updateName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(updateName),
      textColor: theme.colorScheme.background,
      // titleTextStyle: theme.textTheme.titleMedium!.copyWith(
      //   fontWeight: FontWeight.w600,
      // ),
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(SizeResource.value_2),
        width: SizeResource.value_22,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: theme.colorScheme.background,
            width: SizeResource.value_2,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.background,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
