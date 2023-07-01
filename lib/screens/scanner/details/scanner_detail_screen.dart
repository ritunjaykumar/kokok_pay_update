import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/resources/routes_manager.dart';
import 'package:kokok_pay/screens/scanner/details/scanner_detail_provider.dart';
import 'package:kokok_pay/screens/widgets/widget/widgets.dart';
import 'package:provider/provider.dart';

class ScannerDetailScreen extends StatefulWidget {
  const ScannerDetailScreen({Key? key}) : super(key: key);

  @override
  State<ScannerDetailScreen> createState() => _ScannerDetailScreenState();
}

class _ScannerDetailScreenState extends State<ScannerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScannerDetailProvider>(
      create: (ctx) => ScannerDetailProvider(context)..init(),
      child: const _ScannerDetailScreenMain(),
    );
  }
}

///
class _ScannerDetailScreenMain extends StatefulWidget {
  const _ScannerDetailScreenMain({Key? key}) : super(key: key);

  @override
  State<_ScannerDetailScreenMain> createState() => _ScannerDetailScreenMainState();
}

class _ScannerDetailScreenMainState extends State<_ScannerDetailScreenMain> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  double amount = 0;
  String description = '';

  void _proceed() {
    bool validate = _formKey.currentState!.validate();
    if (validate == false) return;
    _formKey.currentState!.save();
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return ConfirmationTransaction(
            amount: amount,
            description: description,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Payment'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Name'),
            subtitle: const Text('Mr. Fragrance'),
            subtitleTextStyle: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            leading: const CircleAvatar(
              foregroundImage: AssetImage(ImagesFile.myPic),
            ),
          ),
          Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Amount',
                        labelText: 'Amount',
                        prefix: Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Text('LAK'),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (amount) {
                        if (amount == null) return 'please enter amount';
                        try {
                          double dAmount = double.parse(amount);
                          return null;
                        } catch (error) {
                          return 'Invalid amount format';
                        }
                      },
                      onSaved: (amount) {
                        this.amount = double.parse(amount!);
                      },
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Description',
                        labelText: 'Description',
                        prefixIcon: Icon(Icons.description_outlined),
                      ),
                      validator: (description) {
                        if (description == null) return 'please enter amount';
                        return null;
                      },
                      onSaved: (description) {
                        this.description = description!;
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _proceed,
                        child: const Text('Proceed'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmationTransaction extends StatelessWidget {
  const ConfirmationTransaction({super.key, required this.amount, required this.description});

  final double amount;
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
        _listTile('Mr. Inpone', 'From', context),
        _listTile('Mr. Fragrance', 'To', context),
        _listTile('LAK $amount', 'Transaction Amount', context),
        _listTile(description, 'Description', context, false),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: (){
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
          Text(subTitle, style: textTheme.bodyLarge),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(title, style: textTheme.titleMedium),
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
