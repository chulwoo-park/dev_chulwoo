enum Platform {
  android,
  fuchsia,
  ios,
  linux,
  macos,
  web,
  windows,
}

extension PlatformExtension on Platform {
  bool get isAndroid => this == Platform.android;
  bool get isFuchsia => this == Platform.fuchsia;
  bool get isIOS => this == Platform.ios;
  bool get isLinux => this == Platform.linux;
  bool get isMacos => this == Platform.macos;
  bool get isWeb => this == Platform.web;
  bool get isWindows => this == Platform.windows;
}
