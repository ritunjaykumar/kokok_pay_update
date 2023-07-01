import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:kokok_pay/screens/card/card_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';

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
      appBar: AppBar(title: const Text('My Card')),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.black87,
                  Colors.black12,

                  /*AppColors.colorB58D67,
                  AppColors.colorB58D67,
                  AppColors.colorE5D1B2,
                  AppColors.colorF9EED2,
                  AppColors.colorFFFFFD,
                  AppColors.colorF9EED2,
                  AppColors.colorB58D67,*/
                ],
                begin: Alignment(-1, -4),
                end: Alignment(1, 4),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: CreditCardWidget(
              cardNumber: '1234567890123456',
              expiryDate: '07/2029',
              cardHolderName: 'Mr. Inpone',
              cvvCode: '123',
              showBackView: true,
              cardBgColor: Colors.black,
              // glassmorphismConfig: Glassmorphism.defaultConfig(),
              backgroundImage: 'assets/card_bg.png',
              labelValidThru: 'VALID\nTHRU',
              obscureCardNumber: true,
              obscureInitialCardNumber: false,
              obscureCardCvv: true,
              isHolderNameVisible: false,
              // height: 175,
              textStyle: textTheme.titleMedium,
              width: MediaQuery.of(context).size.width,
              isChipVisible: true,
              isSwipeGestureEnabled: true,
              animationDuration: const Duration(milliseconds: 1000),
              frontCardBorder: Border.all(color: Colors.grey),
              backCardBorder: Border.all(color: Colors.grey),
              customCardTypeIcons: [],
              onCreditCardWidgetChange: (CreditCardBrand) {},
            ),
          ),
        ],
      ),
    );
  }
}
