import 'dart:io';

import 'package:PersonalAssistantApp/Models/ScheduleGetResponse.dart';
import 'package:PersonalAssistantApp/Models/SuggestGetResponse.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class GetRequests {
  static Future<SuggestGetResponse> suggest(String action) async {
    final res = await http.get("http://127.0.0.1:8094/suggest?action=" + action);

    if(res.statusCode == 200) {
      return SuggestGetResponse.fromJson(json.decode(res.body));
    } else {
      throw Exception("failed to load json");
    }
  }

  static Future<ScheduleGetResponse> schedule() async {
    final res = await http.get("http://127.0.0.1:8094/schedule");

    if(res.statusCode == 200) {
      return ScheduleGetResponse.fromJson(json.decode(res.body));
    } else {
      throw Exception("failed to load json");
    }
  }
}