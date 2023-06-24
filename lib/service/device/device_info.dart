import '/models/enums/enums.dart';

class DeviceInfo {
  final PlatformType platformType;
  final String deviceId;
  final String osVersion;
  final String modelNo;

  DeviceInfo(this.platformType, this.deviceId, this.osVersion, this.modelNo);

  @override
  String toString() {
    return '''DeviceInfo{
      platformType: $platformType,
      deviceId: $deviceId,
      osVersion: $osVersion,
      modelNo: $modelNo,
    }''';
  }
}
