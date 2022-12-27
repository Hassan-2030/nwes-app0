import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';


import '../../../models/SourceResponce.dart';
import '../../components/constanst.dart';

class ApiManger {




  static Future<SourceResponce> getSources()async {
    // GET https://newsapi.org/v2/top-headlines?country=us&apiKey=46998139806b49238a5714277e72b757
    //  https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    var URL = Uri.https(BASe, 'v2/top-headlines/sources', {
      "apiKey": ABIKEY
    });

    Response source= await http.get(URL);
    print(source.statusCode);
    var json = jsonDecode(source.body);
    SourceResponce sourceResponce = SourceResponce.fromJson(json);
    return sourceResponce;
  }
}