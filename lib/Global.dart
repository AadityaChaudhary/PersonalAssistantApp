
import 'package:PersonalAssistantApp/Models/Event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/classes/event.dart' as Calender;

import 'Models/GetRequests.dart';
import 'Models/Responses/ScheduleGetResponse.dart';

class Global {
  static Future<ScheduleGetResponse> schedule;
  static List<Event> events;

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  static void getEvents() {
    schedule = GetRequests.schedule();
//    schedule.whenComplete(() => {
//      events = schedule.
//      generateMap(),
//      print("all good in the hood")
//    });

  }

  static EventList<Calender.Event> generateMap() {
      Map<DateTime, List<Calender.Event>> eventList = new Map<DateTime, List<Calender.Event>>();
      for (Event e in events) {
        if(!eventList.containsKey(e.startTime)) {
          eventList[e.startTime] = new List<Calender.Event>();
        }
        eventList[e.startTime].add(new Calender.Event(
          date: e.startTime,
          title: e.action,
          icon: _eventIcon
        ));
      }
      return new EventList(events: eventList);
  }

  static EventList<Calender.Event> markedDateMap;




}