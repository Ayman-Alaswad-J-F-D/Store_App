import 'dart:io';

// ByteData data =
//     await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
// SecurityContext.defaultContext
//     .setTrustedCertificatesBytes(data.buffer.asUint8List());

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
