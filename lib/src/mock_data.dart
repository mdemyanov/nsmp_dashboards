import 'dart:convert';
import 'dart:async';
Future<Map<String, dynamic>> data() async {
  return <String, dynamic>{
    "ok": true,
    "data": [
      {
        "count": 50,
        "UUID": "userReport\$2309645",
        "title": "17.07.2018 13:53 - 24.07.2018 13:53"
      },
      {
        "count": 90,
        "UUID": "userReport\$2309646",
        "title": "24.07.2018 13:53 - 31.07.2018 13:53"
      },
      {
        "count": 80,
        "UUID": "userReport\$2309647",
        "title": "31.07.2018 13:53 - 07.08.2018 13:53"
      },
      {
        "count": 100,
        "UUID": "userReport\$2309648",
        "title": "07.08.2018 13:53 - 14.08.2018 13:53",
        "color": "2A6763"
      },
      {
        "count": 70,
        "UUID": "userReport\$2309649",
        "title": "14.08.2018 13:53 - 21.08.2018 13:53"
      },
      {
        "count": 80,
        "UUID": "userReport\$2309650",
        "title": "21.08.2018 13:53 - 28.08.2018 13:53"
      },
      {
        "count": 90,
        "UUID": "userReport\$2309651",
        "title": "28.08.2018 13:53 - 04.09.2018 13:53"
      },
      {
        "count": 120,
        "UUID": "userReport\$2309652",
        "title": "04.09.2018 13:53 - 11.09.2018 13:53"
      }
    ]
  };
}

dynamic getData() {
  JsonCodec json = const JsonCodec();
  String dashboardData = '''{"ok":true,"data":[
      {
        "count": 50,
        "UUID": "userReport\$2309645",
        "title": "17.07.2018 13:53 - 24.07.2018 13:53"
      },
      {
        "count": 90,
        "UUID": "userReport\$2309646",
        "title": "24.07.2018 13:53 - 31.07.2018 13:53",
        "color": "74FF83"
      },
      {
        "count": 80,
        "UUID": "userReport\$2309647",
        "title": "31.07.2018 13:53 - 07.08.2018 13:53",
        "color": "2378F1"
      },
      {
        "count": 100,
        "UUID": "userReport\$2309648",
        "title": "07.08.2018 13:53 - 14.08.2018 13:53",
        "color": "2A6763"
      },
      {
        "count": 70,
        "UUID": "userReport\$2309649",
        "title": "14.08.2018 13:53 - 21.08.2018 13:53"
      },
      {
        "count": 80,
        "UUID": "userReport\$2309650",
        "title": "21.08.2018 13:53 - 28.08.2018 13:53"
      },
      {
        "count": 90,
        "UUID": "userReport\$2309651",
        "title": "28.08.2018 13:53 - 04.09.2018 13:53"
      },
      {
        "count": 120,
        "UUID": "userReport\$2309652",
        "title": "04.09.2018 13:53 - 11.09.2018 13:53",
        "color": "59A8A4"
      }
    ]
  }''';
  return json.decode(dashboardData);
}

String settings = 'byWeeks#bar@fqn-serviceCall@sourceAttr-service@groupAttr-creationDate@group-interval\$1\$week@interval-8\$week';