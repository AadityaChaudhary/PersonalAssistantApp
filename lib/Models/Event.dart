class Event {
  String action;
  List<String> tags;
  DateTime startTime;
  Duration length;
  String repeats;

  Event({this.action,this.tags,this.startTime,this.length,this.repeats});
  factory Event.fromJson(Map<String, dynamic> json) {
    var startTime = DateTime.tryParse(json['start_time']);
    if(startTime == null) return null;

    var durTime = DateTime.tryParse(json['length']);
    if(durTime == null) return null;

    var dur = Duration(hours: durTime.hour,minutes: durTime.minute, seconds: durTime.second);
    return Event(
      action: json["action"],
      tags: json["tags"],
      startTime: startTime,
      length: dur,
      repeats: json["repeats"]
    );

  }
}