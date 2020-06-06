
class PostParameters {
    List<String> tags;
    DateTime startTime;
    DateTime length;
    String repeats;
    bool accepted;

    PostParameters({this.tags,this.startTime,this.length,this.accepted,this.repeats});

    Duration getLength() {
      return Duration(days: length.day, hours: length.hour, minutes: length.minute, seconds: length.second);
    }

    Map<String, dynamic> toJson() {
      return {
          "tags": tags,
          "start_time": startTime.toIso8601String(),
          "length": length.toIso8601String(),
          "accepted": accepted,
          "repeats": repeats
      };
    }
}