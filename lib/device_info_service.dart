import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String> getDeviceModel() async {
    final info = await _deviceInfoPlugin.deviceInfo;
    if (info is AndroidDeviceInfo) {
      return info.model;
    } else if (info is IosDeviceInfo) {
      return info.utsname.machine;
    } else {
      return 'Unsupported Platform';
    }
  }

  static Future<String> getOSVersion() async {
    final info = await _deviceInfoPlugin.deviceInfo;
    if (info is AndroidDeviceInfo) {
      return 'Android ${info.version.release}';
    } else if (info is IosDeviceInfo) {
      return 'iOS ${info.systemVersion}';
    } else {
      return 'Unsupported Platform';
    }
  }
}
