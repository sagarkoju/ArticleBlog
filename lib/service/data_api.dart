import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vlogpost/model/data_model.dart';

class ApiService {
  Future<List<Datum>> getDataModel() async {
    final res = await http.get(
      Uri.parse("https://reqres.in/api/users?page=2"),
    );
    if (res.statusCode == 200) {
      final List result = jsonDecode(res.body)['data'];
      return result.map((e) => Datum.fromJson(e)).toList();
    } else {
      throw Exception(res.reasonPhrase);
    }
  }
}
