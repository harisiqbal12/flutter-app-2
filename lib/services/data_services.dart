import 'dart:convert';
import "package:http/http.dart" as http;
import '../model/data_model.dart';

class DataServices {
  String baseURL = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    String apiURl = "/getplaces";
    http.Response res = await http.get(Uri.parse(baseURL + apiURl));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }
      return <DataModel>[];
    } catch (e) {
      print(e);

      return <DataModel>[];
    }
  }
}
