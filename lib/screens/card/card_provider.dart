import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/base/base_view_model.dart';
import 'package:kokok_pay/screens/card/card_screen.dart';

class CardProvider extends BaseViewModel {
  CardProvider(super.context);

  late CardData _cardData;
  bool _showBack = false;

  @override
  void init() {
    _initCardData();
  }

  void _initCardData() {
    _cardData = CardData(
      cardNumber: '1234 5678 9012 6709',
      cardNumberAlt: 'xxxx xxxx xxxx 6709',
      cardHolderName: 'Mr. Inpone',
      expiryDate: '12/2027',
      cvv: '245',
      onlineTxnLimit: 12388734876,
      atmTxnLimit: 8748783264,
    );
  }

  void showBackToggle() {
    _showBack = !_showBack;
    notifyListeners();
  }

  void showCvvToggle(bool showCvv) {
    if (showCvv != _cardData.showCvv) {
      _cardData.showCvv = showCvv;
      notifyListeners();
    }
  }

  void showCardNumberToggle(bool showCard) {
    if (showCard != _cardData.showCardNumber) {
      _cardData.showCardNumber = showCard;
      notifyListeners();
    }
  }

  void cardBlockToggle(bool cardBlock) {
    if (cardBlock != _cardData.cardBlock) {
      _cardData.cardBlock = cardBlock;
      notifyListeners();
    }
  }

  void updateOnlineTxnAmount() async {
    var amount = await _openBottomSheetAmountWidget('Update Online txn limit');
    if (amount != null) {
      _cardData.onlineTxnLimit = amount;
      notifyListeners();
    }
  }

  void updateAtmTxnAmount() async {
    var amount = await _openBottomSheetAmountWidget('Update Atm txn limit');
    if (amount != null) {
      _cardData.atmTxnLimit = amount;
      notifyListeners();
    }
  }

  Future<double?> _openBottomSheetAmountWidget(String title) async {
    var amount = await showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return AmountInputWidget(
          title: title,
        );
      },
    );
    if (amount != null && amount is double) {
      return amount;
    }
    return null;
  }

  bool get showBack => _showBack;

  CardData get cardData => _cardData;
}

class CardData {
  String cardNumber;
  String cardNumberAlt;
  bool showCardNumber;
  String cardHolderName;
  String expiryDate;
  String cvv;
  bool showCvv;
  bool cardBlock;
  double onlineTxnLimit;
  double atmTxnLimit;

  CardData({
    required this.cardNumber,
    required this.cardNumberAlt,
    this.showCardNumber = false,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvv,
    this.showCvv = false,
    this.cardBlock = false,
    required this.onlineTxnLimit,
    required this.atmTxnLimit,
  });
}
