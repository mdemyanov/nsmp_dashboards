import 'dart:js';

/// Получить количество из элемента массива
num getCount(Map data) => data['count'] as num;

/// Получить название из элемента массива
String getLabel(Map data) => data['title'] as String;

String getUUIDs(Map data) => data['UUID'] as String;

/// Получить цвет из элемента массива
String getHexColor(Map data) => '#${data['color']}';

Map getExtSeries(Map data) => <String, dynamic>{
  'name': getLabel(data),
  'data': [getCount(data)]
};

class DashboardData {
  List<String> _colors = const [];
  List<String> _labels = const [];
  List<String> _uuids = const [];
  List<num> _series = const [];
  List<Map> _extSeries = const [];

  DashboardData(Map<String, dynamic> dataSource) {
    var data = (dataSource['data'] as List).cast<Map>().toList();
    _labels = data.map(getLabel).toList();
    _series = data.map(getCount).toList();
    _extSeries = data.map(getExtSeries).toList();
    _uuids = data.map(getUUIDs).toList();
    if (data[0].containsKey('color')) {
      _colors = data.map(getHexColor).toList();
    }
  }

  List<String> get colors => _colors != null ? _colors : [];

  List<String> get labels => _labels;

  List<num> get series => _series;

  List<Map> get extSeries => _extSeries;

  List<String> get UUIDs => _uuids;

  String getUUID(int index) {
    if (index > _uuids.length) {
      return null;
    }
    return _uuids[index];
  }

  void drillToData(dynamic event, dynamic chartContext, dynamic config) {
    int index = config['dataPointIndex'] as int;
    int seriesIndex = config['seriesIndex'] as int;
    index = index > 0 ? index : seriesIndex;
    if (index == null) {
      print('Не удалось получить индекс для погружения');
      return;
    }
    String UUID = getUUID(index);
    if(UUID == null) {
      print('Не удалось получить UUID для погружения');
      return;
    }
    JsObject top = JsObject.fromBrowserObject(context['parent']);
    top['location']['hash'] = '#uuid:${UUID}';
  }
}
