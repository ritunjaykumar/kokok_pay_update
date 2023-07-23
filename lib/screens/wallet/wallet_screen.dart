import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/wallet/wallet_provider.dart';
import 'package:kokok_pay/screens/widgets/widget/widgets.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WalletProvider>(
      create: (ctx) => WalletProvider(context)..init(),
      child: const _WalletScreenMain(),
    );
  }
}

///
class _WalletScreenMain extends StatefulWidget {
  const _WalletScreenMain({Key? key}) : super(key: key);

  @override
  State<_WalletScreenMain> createState() => _WalletScreenMainState();
}

class _WalletScreenMainState extends State<_WalletScreenMain> {
  /*bool addMoneyPopup = false;

  void addMoneyPopupToggle(bool popup) {
    if (addMoneyPopup == popup) return;
    addMoneyPopup = popup;
    setState(() {});
  }*/

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: colorScheme.background,
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 175,
                width: 350,
                margin: const EdgeInsets.all(16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.primaryContainer,
                      colorScheme.primary.withOpacity(0.5),
                    ],
                    transform: const GradientRotation(180),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mr. Inpone',
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'LAK 237874832',
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 34,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // addMoneyPopupToggle(true);
                          _popupMenu();
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll<Color>(colorScheme.onPrimary),
                        ),
                        label: const Text('Add Money'),
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mini Statement',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    /*IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.date_range),
                    )*/
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  color: colorScheme.primaryContainer,
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Consumer<WalletProvider>(
                      builder: (ctx, walletProvider, child) {
                        return ListView.builder(
                          itemCount: walletProvider.miniStatements.length,
                          itemBuilder: (ctx, i) {
                            final msd = walletProvider.miniStatements[i];
                            return _getListTile(msd);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _popupMenu() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Widget getItem(String title, VoidCallback callback){
      return ListTile(
        title:  Text(title),
        onTap: callback,
        trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 18,),
        titleTextStyle: textTheme.titleMedium,
      );
    }



    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DialogAppbar(title: 'Select Option'),
                getItem('Lao QR',  (){
                  Navigator.of(context).pop();
                  _showQrDialog();
                }),
                getItem('ATM Card',  (){
                  Navigator.of(context).pop();
                  _showBottomNavigation();
                }),
                const SizedBox(height: 18),
              ],
            ),
          );
        });
  }

  /*Widget _popupMenu() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(8),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: () {
                addMoneyPopupToggle(false);
                _showQrDialog();
              },
              child: const Text('Lao Qr')),
          TextButton(
              onPressed: () {
                addMoneyPopupToggle(false);
                _showBottomNavigation();
              },
              child: const Text('ATM Card')),
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                addMoneyPopupToggle(false);
              })
        ],
      ),
    );
  }*/

  Widget _getListTile(MiniStatementData msd) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      padding: const EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
        color: _getColor(msd.type),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 3),
        padding: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text('${msd.currency} ${msd.amount}'),
              titleTextStyle: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              subtitle: Text(msd.desc),
              subtitleTextStyle: textTheme.bodySmall,
              leading: _getStatusIndicator(msd.type),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(msd.date),
                  Text(
                    msd.type == 'sent' ? 'DR' : 'CR',
                    style: textTheme.bodyLarge?.copyWith(
                      color: _getColor(msd.type),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getStatusIndicator(String type) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: _getColor(type),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: _getColor(type),
          shape: BoxShape.circle,
        ),
        child: Icon(
          type == 'sent' ? Icons.arrow_upward : Icons.arrow_downward,
          color: Colors.white,
        ),
      ),
    );
  }

  Color _getColor(String type) {
    return type == 'sent' ? Colors.red : Colors.green;
  }

  void _showQrDialog() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Scan QR to recharge wallet', style: textTheme.titleMedium),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: QrImageView(
                      data:
                          'jsdkfjksjf sfjklsj kfjskfjks jfksjfklsjfklsjf klsjf klsdjfkl dsjfk sdj ',
                      version: QrVersions.auto,
                      size: 320,
                      backgroundColor: colorScheme.onPrimary,
                      embeddedImage: const AssetImage(
                        ImagesFile.laoQRLogo,
                      ),
                      embeddedImageStyle: const QrEmbeddedImageStyle(
                        size: Size(50, 50),
                      ),
                      errorStateBuilder: (cxt, err) {
                        return const Center(
                          child: Text(
                            "Uh oh! Something went wrong...",
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                      padding: const EdgeInsets.all(12),
                      semanticsLabel: 'Qr image',
                    ),
                  ),
                  Align(
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showBottomNavigation() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return const AtmCardInputUi();
      },
    );
  }
}

//////////////////////////////card ui/////////////

class AtmCardInputUi extends StatefulWidget {
  const AtmCardInputUi({super.key});

  @override
  State<AtmCardInputUi> createState() => _AtmCardInputUiState();
}

class _AtmCardInputUiState extends State<AtmCardInputUi> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String? selectedExpiryMonth;
  String? selectedExpiryYear;

  List<String> expiryMonths = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12'
  ];

  List<String> expiryYears = [
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33'
  ];

  @override
  void dispose() {
    super.dispose();
    cardNumberController.dispose();
    cvvController.dispose();
    amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DialogAppbar(
              title: 'Enter Card Details',
              icon: Icons.close,
              callback: () {
                Navigator.of(context).pop();
              }),
          Padding(
            padding: EdgeInsets.only(
              top: 16.0,
              left: 16.0,
              right: 16.0,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                TextFormField(
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  maxLength: 16,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    // CardNumberFormatter(),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Card Number',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter card number';
                    } else if (value.length != 16) {
                      return 'Card number must be 16 digits long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedExpiryMonth,
                        onChanged: (newValue) {
                          setState(() {
                            selectedExpiryMonth = newValue;
                          });
                        },
                        items: expiryMonths.map((month) {
                          return DropdownMenuItem<String>(
                            value: month,
                            child: Text(month),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          labelText: 'Expiry Month',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedExpiryYear,
                        onChanged: (newValue) {
                          setState(() {
                            selectedExpiryYear = newValue;
                          });
                        },
                        items: expiryYears.map((year) {
                          return DropdownMenuItem<String>(
                            value: year,
                            child: Text(year),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          labelText: 'Expiry Year',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: cvvController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 3,
                  decoration: const InputDecoration(
                    labelText: 'CVV',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter CVV';
                    } else if (value.length != 3) {
                      return 'CVV must be 3 digits long';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter amount';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform the desired action here, e.g., process the card details
                      // or navigate to the next screen.
                      // For simplicity, we'll just print the card details here.
                      print('Card Number: ${cardNumberController.text}');
                      print('Expiry Date: $selectedExpiryMonth/$selectedExpiryYear');
                      print('CVV: ${cvvController.text}');
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Wallet recharged successfully')));
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Recharge Wallet'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    if (text.length > oldValue.text.length) {
      if (text.length == 5 || text.length == 10 || text.length == 15) {
        text += ' ';
      }
    }
    return newValue.copyWith(text: text);
  }
}
/*
*
*   Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: addMoneyPopup
                ? Align(
                    alignment: Alignment.topCenter,
                    child: _popupMenu(),
                  )
                : const SizedBox(),
          ),*/
