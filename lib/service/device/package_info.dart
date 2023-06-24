import 'package:package_info_plus/package_info_plus.dart';

class AppPackageInfo {
  final String appName;
  final String packageName;
  final String version;
  final String buildNumber;

  const AppPackageInfo({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
  });
}
