import 'package:chakre_pdf_viewer/src/password_check/password_protected_pdf_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';


abstract class PasswordProtectedPdfCheckerPlatform extends PlatformInterface {
  /// Constructs a PasswordProtectedPdfCheckerPlatform.
  PasswordProtectedPdfCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static PasswordProtectedPdfCheckerPlatform _instance = MethodChannelPasswordProtectedPdfChecker();

  /// The default instance of [PasswordProtectedPdfCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelPasswordProtectedPdfChecker].
  static PasswordProtectedPdfCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PasswordProtectedPdfCheckerPlatform] when
  /// they register themselves.
  static set instance(PasswordProtectedPdfCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
