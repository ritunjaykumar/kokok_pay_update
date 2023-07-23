import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/resources/routes_manager.dart';
import 'package:kokok_pay/screens/painter/background_painter.dart';
import 'package:kokok_pay/screens/painter/login_painter.dart';
import 'package:kokok_pay/screens/painter/qr_screen_painter.dart';
import 'package:kokok_pay/screens/painter/setting_painter.dart';
import 'package:kokok_pay/screens/topup/topup_provider.dart';
import 'package:kokok_pay/screens/widgets/widget/widgets.dart';
import 'package:provider/provider.dart';

class TopupScreen extends StatefulWidget {
  const TopupScreen({Key? key}) : super(key: key);

  @override
  State<TopupScreen> createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TopupProvider>(
      create: (ctx) => TopupProvider(context)..init(),
      child: const _TopupScreenMain(),
    );
  }
}

///
class _TopupScreenMain extends StatefulWidget {
  const _TopupScreenMain({Key? key}) : super(key: key);

  @override
  State<_TopupScreenMain> createState() => _TopupScreenMainState();
}

class _TopupScreenMainState extends State<_TopupScreenMain> {
  String _topupType = 'Prepaid';
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _providerController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _changeTopType(String? topup) {
    if (topup != null && _topupType != topup) {
      _topupType = topup;
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _mobileNumberController.dispose();
    _providerController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Topup')),
      body: CustomPaint(
        painter: QrScreenPainter(colorScheme.primary),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Topup Type', style: textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: ["Prepaid", 'Postpaid'].map((e) {
                        return RadioMenuButton<String>(
                          value: e,
                          groupValue: _topupType,
                          onChanged: _changeTopType,
                          child: Text(e, style: textTheme.titleMedium),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Recharge Details', style: textTheme.titleMedium),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _mobileNumberController,
                        decoration: InputDecoration(
                          label: const Text('Mobile Number'),
                          hintText: 'Mobile Number',
                          prefixIcon: const Icon(Icons.phone_android),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.person_add_alt_1),
                            onPressed: () async {
                              var mobileNumber = await context.read<TopupProvider>().readContact();
                              if (mobileNumber != null) {
                                _mobileNumberController.text = mobileNumber;
                              }
                            },
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (mobileNumber) {
                          if (mobileNumber == null || mobileNumber.isEmpty) {
                            return 'please enter mobile number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      const Text('Select Provider'),
                      TextFormField(
                        controller: _providerController,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: 'Select Provider',
                          prefixIcon: const Icon(Icons.person_sharp),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 18,
                            ),
                            onPressed: () async {
                              var providerName = await _showProviderDialog();
                              if (providerName != null) {
                                _providerController.text = providerName;
                              }
                            },
                          ),
                        ),
                        validator: (provider) {
                          if (provider == null || provider.isEmpty) {
                            return 'please select provider';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 22),
                      TextFormField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          label: const Text('Amount'),
                          hintText: 'Amount',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'LAK',
                              style: textTheme.titleMedium,
                            ),
                          ),
                        ),
                        validator: (amount) {
                          if (amount == null || amount.isEmpty) {
                            return 'please enter amount';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
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
                                chipAmount('500'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            SizedBox(
              width: MediaQuery.of(context).size.width * .85,
              child: ElevatedButton(
                onPressed: () {
                  var validate = _formKey.currentState?.validate();
                  if (validate == false) return;
                  _showConfirmationBottomSheet();
                },
                child: const Text('Continue'),
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
        _amountController.text = amount;
      },
      child: Chip(label: Text('LAK $amount')),
    );
  }

  Future<String?> _showProviderDialog() async {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    Widget getItem(String title, String image) {
      return ListTile(
        leading: CircleAvatar(child: Image.asset(image, height: 32, width: 32)),
        title: Text(title),
        onTap: () {
          Navigator.of(context).pop(title);
        },
        trailing: const Icon(
          Icons.arrow_forward_ios_sharp,
          size: 18,
        ),
        titleTextStyle: textTheme.titleMedium,
      );
    }

    return await showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DialogAppbar(title: 'Select provider'),
              getItem('LTC', UtilLogo.ltc),
              getItem('ETL', UtilLogo.etl),
              getItem('Unitel', UtilLogo.unitel),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void _showConfirmationBottomSheet() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Widget getItem(String title, String value) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: textTheme.titleMedium),
              Text(value, style: textTheme.bodyLarge),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(),
        ],
      );
    }

    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Mr. Inpone'),
              subtitle: const Text('Wallet|832748278234'),
              trailing: Text('LAK 123242342', style: textTheme.titleMedium),
              titleTextStyle: textTheme.titleMedium,
              subtitleTextStyle: textTheme.bodyLarge,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  ImagesFile.avatar,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  getItem('Topup type', _topupType),
                  getItem('Mobile Number', _mobileNumberController.text),
                  getItem('Provider', _providerController.text),
                  getItem('amount', _amountController.text),
                  getItem('Currency', 'LAK'),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacementNamed(
                              Routes.topupResultScreen,
                              arguments: _topupType,
                            );
                          },
                          child: const Text('Recharge'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
