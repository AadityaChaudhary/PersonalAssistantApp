import '../Event.dart';

class ScheduleGetResponse {
  List<Event> events;

  ScheduleGetResponse({this.events});
  factory ScheduleGetResponse.fromJson(Map<String, dynamic> json) {
    List<Event> events = new List<Event>();
    for(Map<String,dynamic> e in json["events"]) {
      Event x = Event.fromJson(e);
      if(x == null) {
        print("stuff is null");
        continue;
      }
      events.add(x);
    }
    return ScheduleGetResponse(
      events: events
    );
  }

}
