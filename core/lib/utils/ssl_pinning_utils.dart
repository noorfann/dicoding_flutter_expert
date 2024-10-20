import 'dart:io';

import 'package:flutter/services.dart';

class SslPinningUtils {
  static Future<SecurityContext> get globalContext async {
    final sslCert = await rootBundle.load('packages/core/cert/cert.pem');
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
    return securityContext;
  }
}
