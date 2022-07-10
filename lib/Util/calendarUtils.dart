// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String? title, desc, imgLink;

  const Event(this.title, this.desc, this.imgLink);

  @override
  String toString() => title!;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_eventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}', 'sampleDesc', 'assets/images/ub_building.jpeg')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1', 'sampleDesc', 'assets/images/ub_building.jpeg'),
      Event('Today\'s Event 2', 'sampleDesc', 'assets/images/ub_building.jpeg'),
    ],
  });

final Map<DateTime, List<Event>> _eventSource = {
  DateTime.now() : [
    Event('Today\'s Event 1', 'sampleDesc', 'assets/images/ub_building.jpeg'),
    Event('Today\'s Event 2', 'sampleDesc', 'assets/images/ub_building.jpeg'),
  ],
  DateTime.utc(2022, 5, 11): [
    Event('May 11th\'s Event 1', 'MayEventDesc', 'assets/images/ub_building.jpeg')
  ]
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);