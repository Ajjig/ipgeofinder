import 'dart:convert';
import '../../../data/models/ip_data_model.dart';
import '../../../providers/api.dart';

class IpRepository {
  static Future<IpDataModel> fetchIpData(String ip) async {
    final response = await Api.fetch(ip);
    if (response.statusCode == 200) {
      return IpDataModel.fromJson(ip, jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}