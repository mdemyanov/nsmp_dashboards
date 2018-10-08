import 'dashboard_data.dart';

class Options {
  String _type;
  DashboardData _data;
  Map<String, dynamic> _options = <String, dynamic>{};

  Options(String type, Map<String, dynamic> data) {
    _type = type;
    _data = DashboardData(data);
  }

  Map toMap() {
    _options.addAll(getColors());
    _options.addAll(<String, dynamic>{
      'tooltip': <String, dynamic>{
        'followCursor': true
      }
    });
    switch (_type) {
      case 'bar':
      case 'column':
        _options.addAll(<String, dynamic>{
          'chart': {'type': 'bar', 'events': getEvents()},
          'plotOptions': {
            'bar': {
              'horizontal': _type == 'bar' ? true : false,
              'distributed': true
            }
          }
        });
        _options.addAll(getSeries(false));
        _options.addAll(getLabels(false));
        break;
      case 'line':
      case 'area':
        _options.addAll(<String, dynamic>{
          'chart': {
            'type': _type, 'events': getEvents()
          }
        });
        _options.addAll(getSeries(false));
        _options.addAll(getLabels(false));
        break;
      case 'pie':
      case 'donut':
        _options.addAll(<String, dynamic>{
          'chart': {
            'type': _type, 'events': getEvents()
          }
        });
        _options.addAll(getSeries(true));
        _options.addAll(getLabels(true));
        break;
      case 'radialBar':
        _options.addAll(<String, dynamic>{
          'chart': {
            'type': 'radialBar', 'events': getEvents()
          },
          'plotOptions': {
            'radialBar': {
              'dataLabels': {
                'showOn': 'hover',
                'name': {
                  'show': true,
                  'fontSize': '22px',
                  'value': {
                    'show': true,
                    'formatter': (String value) {
                      print(value);
                      return value;
                    }
                  }
                }
              }
            }
          }
        });
        _options.addAll(getSeries(true));
        _options.addAll(getLabels(true));
        break;
    }
    return _options;
  }

  Map<String, dynamic> getSeries(bool simple) {
    if (simple) {
      return <String, dynamic>{'series': _data.series};
    }
    return <String, dynamic>{
      'series': [
        <String, dynamic>{
          'name': '',
          'data': _data.series
        }
      ]
    };
  }

  Map<String, dynamic> getLabels(bool simple) {
    if (simple) {
      return <String, dynamic>{'labels': _data.labels};
    }
    return <String, dynamic>{
      'xaxis': <String, dynamic>{
        'categories': _data.labels
      }
    };
  }

  Map<String, dynamic> getColors() {
    if (_data.colors.length > 0) {
      return <String, dynamic>{
        'colors': _data.colors
      };
    }
    return <String, dynamic>{};
  }

  Map<String, dynamic> getEvents() {
    return <String, dynamic>{
      'dataPointSelection': _data.drillToData
      };
  }
}