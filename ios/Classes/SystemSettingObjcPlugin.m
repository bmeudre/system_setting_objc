#import "SystemSettingObjcPlugin.h"

@implementation SystemSettingObjcPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"system_setting_objc"
            binaryMessenger:[registrar messenger]];
  SystemSettingObjcPlugin* instance = [[SystemSettingObjcPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if([@"gotoSetting" isEqualToString:call.method]) {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    result(nil);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
