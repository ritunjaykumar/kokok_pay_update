class StringResource {
  const StringResource._singleton();

  static const StringResource _instance = StringResource._singleton();

  factory StringResource() => _instance;

  final String appTitle = 'Kok Kok Pay';
  final String updateMsg =
      'Please update your app to latest version to get the latest features and security patches. This update contains below features';
  final String qrMsg =
      'Note: QR will be saved automatically in Photo Gallery, Open your Bank\'s Mobile app and scan the QR from Gallery';
}
