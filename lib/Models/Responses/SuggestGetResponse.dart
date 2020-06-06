import 'package:flutter/material.dart';

class SuggestGetResponse {
   List<String> tags;
   DateTime startTime;
   DateTime length;
   String repeats;

   SuggestGetResponse({this.tags,this.startTime,this.length,this.repeats});
   factory SuggestGetResponse.fromJson(Map<String, dynamic> json) {
     var startTime = DateTime.tryParse(json['start_time']);
     if(startTime == null) return null;

     var durTime = DateTime.tryParse(json['length']);
     if(durTime == null) return null;



     return SuggestGetResponse(
       tags: json['tags'],
       startTime: startTime,
       length: durTime,
       repeats: json['repeats']
     );
   }
}