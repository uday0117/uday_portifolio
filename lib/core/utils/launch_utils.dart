import 'package:url_launcher/url_launcher.dart';

class LaunchUtils {
  const LaunchUtils._();

  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> sendMail({
    required String email,
    String subject = '',
    String body = '',
  }) async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject.isNotEmpty) 'subject': subject,
        if (body.isNotEmpty) 'body': body,
      },
    );

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch email composer');
    }
  }
}
