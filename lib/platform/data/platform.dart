import 'package:dev_chulwoo/platform/domain/model.dart';
import 'package:dev_chulwoo/platform/domain/repository.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' as dart;

class PlatformRepositoryImpl extends PlatformRepository {
  Platform getPlatform() {
    if (kIsWeb) {
      return Platform.web;
    }

    if (dart.Platform.isAndroid) {
      return Platform.android;
    } else if (dart.Platform.isFuchsia) {
      return Platform.fuchsia;
    } else if (dart.Platform.isIOS) {
      return Platform.ios;
    } else if (dart.Platform.isLinux) {
      return Platform.linux;
    } else if (dart.Platform.isMacOS) {
      return Platform.macos;
    } else if (dart.Platform.isWindows) {
      return Platform.windows;
    } else {
      throw UnimplementedError();
    }
  }
}
