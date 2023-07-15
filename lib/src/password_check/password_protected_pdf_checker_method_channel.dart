import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'password_protected_pdf_checker_platform_interface.dart';

/// An implementation of [PasswordProtectedPdfCheckerPlatform] that uses method channels.
class MethodChannelPasswordProtectedPdfChecker extends PasswordProtectedPdfCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('password_protected_pdf_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
