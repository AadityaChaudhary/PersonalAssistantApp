
class SuggestGetResponse {
   List<String> tags;
   DateTime startTime;
   double length;
   String repeats;

   SuggestGetResponse({this.tags,this.startTime,this.length,this.repeats});
   factory SuggestGetResponse.fromJson(Map<String, dynamic> json) {
     var startTime = DateTime.tryParse(json['start_time']);
     if(startTime == null) return null;
     
     
     return SuggestGetResponse(
       tags: json['tag'],
       startTime: startTime,
       length: double.tryParse(json['length']),
       repeats: json['repeats']
     );
   }
}