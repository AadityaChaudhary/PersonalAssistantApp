import 'package:PersonalAssistantApp/Models/Constants.dart';
import 'package:PersonalAssistantApp/Models/Parameters/PostParameters.dart';
import 'package:PersonalAssistantApp/Models/Responses/SchedulePostResponse.dart';
import 'package:PersonalAssistantApp/Models/Responses/SuggestPostResponse.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
class PostRequest {

  static Future<SchedulePostResponse> schedule(PostParameters params) async {
    var res = await http.post(
      Constants.API_SCHEDULE,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(params.toJson())
    );

    if(res.statusCode == 200) {
      return SchedulePostResponse.fromJson(json.decode(res.body));
    } else {
      throw Exception("failed to load json");
    }
  }

  static Future<SuggestPostResponse> suggest(PostParameters params) async {
    var res = await http.post(
        Constants.API_SUGGEST,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(params.toJson())
    );

    if(res.statusCode == 200) {
      return SuggestPostResponse.fromJson(json.decode(res.body));
    } else {
      throw Exception("failed to load json");
    }
  }

}