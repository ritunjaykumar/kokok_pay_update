import 'package:kokok_pay/screens/base/base_view_model.dart';

class NotificationProvider extends BaseViewModel {
  NotificationProvider(super.context);

  late List<NotificationData> _notificationDataList;

  @override
  void init() {
    super.init();
    _initNotificationList();
  }

  void _initNotificationList() {
    _notificationDataList = [
      NotificationData(
        title: 'Payment Request',
        subtitle: 'Mr. Inpone has request payment of 300LK.',
        days: '1 days',
      ),
      NotificationData(
        title: '5% Discount on Mobile recharge',
        subtitle: 'get 5% off on mobile recharge above 1999, this offer valid till 02-08-2023',
        days: '2 days',
      ),
      NotificationData(
        title: '2% Discount on Electricity bill payment',
        subtitle: 'get 5% off on electricity bill payment above 1999, this offer valid till 02-08-2023',
        days: '4 days',
      ),
      NotificationData(
        title: 'Payment Request',
        subtitle: 'Mr. Inpone has request payment of 300LK.',
        days: '5 days',
      ),
      NotificationData(
        title: '5% Discount on Mobile recharge',
        subtitle: 'get 5% off on mobile recharge above 1999, this offer valid till 02-08-2023',
        days: '8 days',
      ),
      NotificationData(
        title: '2% Discount on Electricity bill payment',
        subtitle: 'get 5% off on electricity bill payment above 1999, this offer valid till 02-08-2023',
        days: '10 days',
      ),
      NotificationData(
        title: 'Payment Request',
        subtitle: 'Mr. Inpone has request payment of 300LK.',
        days: '15 days',
      ),
      NotificationData(
        title: '5% Discount on Mobile recharge',
        subtitle: 'get 5% off on mobile recharge above 1999, this offer valid till 02-08-2023',
        days: '15 days',
      ),
      NotificationData(
        title: '2% Discount on Electricity bill payment',
        subtitle: 'get 5% off on electricity bill payment above 1999, this offer valid till 02-08-2023',
        days: '20 days',
      ),
    ];
  }

  List<NotificationData> get notificationDataList => _notificationDataList;
}

class NotificationData {
  String title;
  String subtitle;
  String days;

  NotificationData({
    required this.title,
    required this.subtitle,
    required this.days,
  });
}
