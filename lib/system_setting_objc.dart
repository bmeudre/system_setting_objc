import 'dart:async';

import 'package:flutter/services.dart';

enum SettingTarget { WIFI, BLUETOOTH, NOTIFICATION, LOCATION }

class SystemSettingObjc {
  static const MethodChannel _channel =
      const MethodChannel('system_setting_objc');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> goto(SettingTarget target) async {
    String arg;
    switch (target) {
      case SettingTarget.WIFI:
        arg = 'wifi';
        break;
      case SettingTarget.BLUETOOTH:
        arg = 'bluetooth';
        break;
      case SettingTarget.NOTIFICATION:
        arg = 'notification';
        break;
      case SettingTarget.LOCATION:
        arg = 'location';
        break;
    }
    _channel.invokeMethod('gotoSetting', arg);
  }
}
