import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/extra/helper.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kokok_pay/screens/card/card_provider.dart';
import 'package:kokok_pay/screens/widgets/widget/widgets.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CardProvider>(
      create: (ctx) => CardProvider(context)..init(),
      child: const _CardScreenMain(),
    );
  }
}

///
class _CardScreenMain extends StatefulWidget {
  const _CardScreenMain({Key? key}) : super(key: key);

  @override
  State<_CardScreenMain> createState() => _CardScreenMainState();
}

class _CardScreenMainState extends State<_CardScreenMain> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Card'),
        systemOverlayStyle:
            SystemUiOverlayStyle(systemNavigationBarColor: colorScheme.primaryContainer),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorScheme.primary,
              colorScheme.primaryContainer,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 32),
            Consumer<CardProvider>(
              builder: (ctx, cardProvider, child) {
                final cardData = cardProvider.cardData;
                return InkWell(
                  onTap: cardProvider.showBackToggle,
                  child: CreditCard(
                    cardNumber:
                        cardData.showCardNumber ? cardData.cardNumber : cardData.cardNumberAlt,
                    cardExpiry: cardData.expiryDate,
                    cardHolderName: cardData.cardHolderName,
                    cvv: cardData.showCvv ? cardData.cvv : 'xxx',
                    bankName: 'IB Bank',
                    showBackSide: cardProvider.showBack,
                    frontBackground: CardBackgrounds.black,
                    backBackground: CardBackgrounds.white,
                    showShadow: true,
                    mask: getCardTypeMask(cardType: CardType.masterCard),
                    cardType: CardType.other,
                  ),
                );
              },
            ),
            const SizedBox(height: 22),
            Expanded(
              child: Consumer<CardProvider>(
                builder: (ctx, cardProvider, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: colorScheme.onPrimary,
                              ),
                            ),
                            child: SwitchListTile(
                              title: Text(
                                'Show Card Number',
                                style: textTheme.titleMedium?.copyWith(
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                              subtitle: Text(
                                cardProvider.cardData.showCardNumber
                                    ? 'Card number is visible'
                                    : 'Card number is hidden',
                                style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onPrimary.withOpacity(0.7),
                                    fontWeight: FontWeight.w700),
                              ),
                              value: cardProvider.cardData.showCardNumber,
                              onChanged: cardProvider.showCardNumberToggle,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: colorScheme.onPrimary,
                              ),
                            ),
                            child: SwitchListTile(
                              title: Text(
                                'Show CVV',
                                style: textTheme.titleMedium?.copyWith(
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                              subtitle: Text(
                                cardProvider.cardData.showCvv ? 'CVV is visible' : 'CVV is hidden',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onPrimary.withOpacity(0.7),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              value: cardProvider.cardData.showCvv,
                              onChanged: cardProvider.showCvvToggle,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: colorScheme.onPrimary,
                              ),
                            ),
                            child: SwitchListTile(
                              title: Text(
                                'Block Card',
                                style: textTheme.titleMedium?.copyWith(
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                              subtitle: Text(
                                cardProvider.cardData.cardBlock == false
                                    ? 'Card is unblock'
                                    : 'Card has blocked',
                                style: textTheme.bodyMedium?.copyWith(
                                    color: cardProvider.cardData.cardBlock
                                        ? Colors.red
                                        : colorScheme.onPrimary.withOpacity(0.7),
                                    fontWeight: FontWeight.w700),
                              ),
                              value: cardProvider.cardData.cardBlock,
                              onChanged: cardProvider.cardBlockToggle,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: colorScheme.onPrimary,
                              ),
                            ),
                            child: ListTile(
                              title: Text('₭ ${cardProvider.cardData.onlineTxnLimit}'),
                              subtitle: Text(
                                'set online transaction limit',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.scrim.withOpacity(0.7),
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: cardProvider.updateOnlineTxnAmount,
                                icon: const Icon(Icons.edit),
                                color: Colors.white,
                              ),
                              titleTextStyle: textTheme.titleLarge?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          /*Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: colorScheme.onPrimary,
                              ),
                            ),
                            child: ListTile(
                              title: Text('₭ ${cardProvider.cardData.atmTxnLimit}'),
                              subtitle: Text(
                                'set ATM transaction limit',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.scrim.withOpacity(0.7),
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: cardProvider.updateAtmTxnAmount,
                                icon: const Icon(Icons.edit),
                                color: Colors.white,
                              ),
                              titleTextStyle: textTheme.titleLarge?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////
class AmountInputWidget extends StatefulWidget {
  const AmountInputWidget({super.key, required this.title});

  final String title;

  @override
  State<AmountInputWidget> createState() => _AmountInputWidgetState();
}

class _AmountInputWidgetState extends State<AmountInputWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  double amount = 0;

  void _formSubmit() {
    var validate = _formKey.currentState!.validate();
    if (validate == false) return;
    _formKey.currentState?.save();
    Navigator.of(context).pop(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DialogAppbar(
          title: widget.title,
          icon: Icons.close,
          callback: () {
            Navigator.of(context).pop();
          },
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 12.0,
            left: 12,
            right: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter amount',
                    prefix: Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Text('LAK'),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (amount) {
                    if (amount == null || amount.isEmpty) {
                      return 'please enter the amount';
                    }
                    try {
                      double.parse(amount);
                      return null;
                    } catch (error) {
                      return 'please enter valid amount';
                    }
                  },
                  onSaved: (amount){
                    this.amount = double.parse(amount!);
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _formSubmit,
                    child: const Text('Proceed'),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        )
      ],
    );
  }
}
