import 'dart:io';

// In a development environment, you might be working with a server that uses a self-signed SSL certificate.
// By default, Dart's HTTP client rejects connections to servers with untrusted certificates.
// This code bypasses that check, allowing your application to accept self-signed certificates.
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}