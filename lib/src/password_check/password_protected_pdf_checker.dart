import 'package:chakre_pdf_viewer/src/password_check/password_protected_pdf_checker_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';


class PasswordProtectedPdfChecker {
  static const MethodChannel _channel =
      MethodChannel('flutter_plugin_pdf_viewer');

  Future<String?> getPlatformVersion() {
    return PasswordProtectedPdfCheckerPlatform.instance.getPlatformVersion();
  }

  Future<bool> isPDFPasswordProtected(Uint8List bytes) async {
    try {
      final bool result =
          await _channel.invokeMethod('checkPasswordProtectedPDF', bytes);
      return result;
    } catch (error) {
      if (kDebugMode) {
        print('Error inside isPDFPasswordProtected: ${error.toString()}');
      }
    }

    return false;
  }
}
