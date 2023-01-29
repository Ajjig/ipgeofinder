import 'package:http/http.dart' as http;
import '../core/constants/constants.dart';
import '../core/keys/keys.dart';

class Api {
  static Future<http.Response> fetch(String ip) async {
    final response = await http.get(
      Uri.https(
        kBaseLink,
        '/ipgeo',
        {
          'apiKey': kApiKey,
          'ip': ip,
        },
      ),
    );
    return response;
  }
}
