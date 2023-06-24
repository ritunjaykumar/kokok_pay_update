import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kokok_pay/application/application.dart';
import 'package:kokok_pay/resources/size_manager.dart';
import 'package:provider/provider.dart';

import '/screens/before/policy/policy_provider.dart';
import '../../../utils/data/term_condition_data.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({Key? key}) : super(key: key);

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  bool _init = true;
  late final bool _isFirstTime;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      _isFirstTime = ModalRoute.of(context)?.settings.arguments as bool;
      _init = false;
      logger.i('isFirst time: $_isFirstTime');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PolicyProvider>(
      create: (ctx) => PolicyProvider(context, _isFirstTime),
      child: const _PolicyScreenMain(),
    );
  }
}

class _PolicyScreenMain extends StatefulWidget {
  const _PolicyScreenMain({Key? key}) : super(key: key);

  @override
  State<_PolicyScreenMain> createState() => _PolicyScreenMainState();
}

class _PolicyScreenMainState extends State<_PolicyScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(SizeResource.value_16),
        child: Column(
          children: const [
            _TermConditionWidget(),
            // _ActionLayout(),
          ],
        ),
      ),
    );
  }
}

class _TermConditionWidget extends StatelessWidget {
  const _TermConditionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Html(
              data: termConditionData,
            ),
            const _ActionLayout(),
          ],
        ),
      ),
    );
  }
}

/*
class _TermConditionView extends StatelessWidget {
  const _TermConditionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PolicyProvider>(
      builder: (_, policyProvider, child) {
        return ListView.builder(
          itemCount: policyProvider.termConditions.length,
          itemBuilder: (ctx, i) => _TermConditionContent(
            i + 1,
            policyProvider.termConditions[i],
          ),
        );
      },
    );
  }
}

class _TermConditionContent extends StatelessWidget {
  const _TermConditionContent(this.sl, this._keyPair, {Key? key}) : super(key: key);
  final KeyPair _keyPair;
  final int sl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        text: '$sl. ${_keyPair.key}: ',
        style: theme.textTheme.titleMedium,
        children: [
          TextSpan(
            text: '${_keyPair.value}\n',
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}*/

class _ActionLayout extends StatelessWidget {
  const _ActionLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<PolicyProvider>(
      builder: (_, policyProvider, child) {
        return policyProvider.isFirst
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: policyProvider.termCondition,
                        onChanged: (onChanged) {
                          policyProvider.termCondition = onChanged!;
                        },
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'I accept the ',
                            style: theme.textTheme.bodyMedium,
                            children: [TextSpan(text: 'Term & Condition', style: theme.textTheme.titleMedium)]),
                      ),
                      // Text('I accept the Terms & Conditions', style: theme.textTheme.bodyLarge)
                    ],
                  ),
                  Container(
                    // alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: SizeResource.value_8),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: policyProvider.termCondition ? policyProvider.proceed : null,
                      child: const Text('Proceed'),
                    ),
                  ),
                ],
              )
            : Container(
                // alignment: Alignment.center,
                padding: const EdgeInsets.only(top: SizeResource.value_8),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: policyProvider.proceed,
                  child: const Text('Proceed'),
                ),
              );
      },
    );
  }
}
