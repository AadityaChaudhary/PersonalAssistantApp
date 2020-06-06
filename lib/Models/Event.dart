class Event {
  String action;
  List<String> tags;
  DateTime startTime;
  double length;
  String repeats;

  Event({this.action,this.tags,this.startTime,this.length,this.repeats});
  factory Event.fromJson(Map<String, dynamic> json) {
    var startTime = DateTime.tryParse(json['start_time']);
    if(startTime == null) return null;

    return Event(
      action: json["action"],
      tags: json["tags"],
      startTime: startTime,
      length: double.tryParse(json['length']),
      repeats: json["repeats"]
    );

  }
}