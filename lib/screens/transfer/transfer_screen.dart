import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kokok_pay/resources/routes_manager.dart';
import 'package:kokok_pay/screens/transfer/transfer_provider.dart';
import 'package:kokok_pay/screens/widgets/widget/widgets.dart';
import 'package:provider/provider.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TransferProvider>(
      create: (ctx) => TransferProvider(context)..init(),
      child: const _TransferScreenMain(),
    );
  }
}

///
class _TransferScreenMain extends StatefulWidget {
  const _TransferScreenMain({Key? key}) : super(key: key);

  @override
  State<_TransferScreenMain> createState() => _TransferScreenMainState();
}

class _TransferScreenMainState extends State<_TransferScreenMain> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String toMember = 'KOK KOK Wallet';
  bool showBalance = false;

  void showBalanceToggle() {
    showBalance = !showBalance;
    setState(() {});
  }

  void onClickChip(String amount) {
    _amountController.text = amount;
  }

  @override
  void dispose() {
    super.dispose();
    _mobileNumberController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fund Transfer'),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: colorScheme.background,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Card(
              elevation: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        // color: colorScheme.primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        gradient: LinearGradient(colors: [
                          colorScheme.primary,
                          colorScheme.primaryContainer,
                        ])),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mr. Inpone',
                                style: textTheme.titleMedium?.copyWith(
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                              Text(
                                '2052592794',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                              Text(
                                showBalance ? 'LAK 103,345,345' : 'xxxxxxxxxxx',
                                style: textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.onPrimary,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: OutlinedButton(
                            onPressed: showBalanceToggle,
                            style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
                            child: Text(showBalance ? 'Hide Balance' : 'Show Balance'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('To Member'),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(toMember),
                                IconButton(
                                  onPressed: () {
                                    showBankDialog();
                                  },
                                  icon: const Icon(Icons.arrow_drop_down_outlined),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text('To Mobile Number'),
                        TextField(
                          controller: _mobileNumberController,
                          decoration: InputDecoration(
                              hintText: '20XXXXXXXXXXX',
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  var mobileNumber =
                                      await context.read<TransferProvider>().readContact();
                                  if (mobileNumber != null) {
                                    _mobileNumberController.text = mobileNumber;
                                  }
                                },
                                icon: Icon(
                                  Icons.contact_page_rounded,
                                  color: colorScheme.primary,
                                ),
                              ),
                              prefixIcon: const Icon(Icons.phone_android)),
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 12),
                        const Text('Enter Amount'),
                        TextField(
                          controller: _amountController,
                          decoration: const InputDecoration(
                            hintText: '00',
                            prefix: Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: Text('LAK'),
                            ),
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 12),
                        const Text('Description'),
                        TextField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                              hintText: 'enter description',
                              prefixIcon: Icon(Icons.description)),
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Select recent transaction amount'),
                        Wrap(
                          spacing: 12,
                          children: [
                            chipAmount('5000'),
                            chipAmount('10000'),
                            chipAmount('50000'),
                            chipAmount('1000000'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          showConfirmationDialog();
                        },
                        child: const Text('Proceed'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chipAmount(String amount) {
    return InkWell(
      onTap: () {
        onClickChip(amount);
      },
      child: Chip(label: Text('LAK $amount')),
    );
  }

  void showBankDialog() async {
    var memberType = await showDialog(
      context: context,
      builder: (ctx) {
        return const Dialog(
          child: MemberSelectDialog(),
        );
      },
    );
    if (memberType != null) {
      toMember = memberType;
      setState(() {});
    }
  }

  void showConfirmationDialog() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return ConfirmationTransaction(
          amount: _amountController.text,
          description: _descriptionController.text,
        );
      },
    );
  }
}

//////////////////////
class MemberSelectDialog extends StatelessWidget {
  const MemberSelectDialog({super.key});

  Widget _getChild(String title, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.of(context).pop(title);
      },
      child: Row(
        children: [
          const Icon(Icons.circle, color: Colors.black45),
          const SizedBox(width: 6),
          Text(title, style: textTheme.titleMedium),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(child: Text('select Member type', style: textTheme.titleMedium)),
            const Divider(),
            const SizedBox(height: 8),
            _getChild('Kok Kok Wallet', context),
            const SizedBox(height: 8),
            _getChild('Indochina Bank', context),
          ],
        ),
      ),
    );
  }
}

/////////
class ConfirmationTransaction extends StatelessWidget {
  const ConfirmationTransaction({super.key, required this.amount, required this.description});

  final String amount;
  final String description;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DialogAppbar(
          title: 'Confirm Transaction',
          icon: Icons.close,
          callback: () {
            Navigator.of(context).pop();
          },
        ),
        _listTile('Mr. Inpone', 'From Customer', context),
        _listTile('Mr. Fragrance\n2052593425', 'To Customer', context),
        _listTile('LAK $amount', 'Transaction Amount', context),
        _listTile(description, 'Description', context),
        _listTile('LAK 0.0', 'Transaction Fee', context, false),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(Routes.resultScreen);
            },
            child: const Text('Confirm'),
          ),
        ),
      ],
    );
  }

  Widget _listTile(String title, dynamic subTitle, BuildContext context, [bool border = true]) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subTitle, style: textTheme.bodyMedium),
          // const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(title, style: textTheme.titleSmall),
          ),
          if (border)
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: double.infinity,
              height: 1,
              color: Colors.grey.shade400,
            ),
        ],
      ),
    );
  }
}
