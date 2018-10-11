import 'dashboard_data.dart';

class Options {
  String _type;
  DashboardData _data;
  Map<String, dynamic> _options = <String, dynamic>{};

  Options(String type, Map<String, dynamic> data) {
    _type = type;
    _data = DashboardData(data);
  }

//'height': '${_data.series.length*30}px'
  Map toMap() {
    _options.addAll(getColors());
    _options.addAll(<String, dynamic>{
      'tooltip': <String, dynamic>{'followCursor': true}
    });
    switch (_type) {
      case 'bar':
        num barHeigth = _data.series.length;
        _options.addAll(<String, dynamic>{
          'chart': {
            'type': 'bar',
            'events': getEvents(),
            'height': '${(barHeigth < 3 ? 3 : barHeigth) * 60}px'
          },
          'plotOptions': {
            'bar': {'horizontal': true, 'distributed': true}
          }
        });
        _options.addAll(getSeries(false));
        _options.addAll(getLabels(false));
        break;
      case 'column':
        _options.addAll(<String, dynamic>{
          'chart': {'type': 'bar', 'events': getEvents()},
          'plotOptions': {
            'bar': {'horizontal': false, 'distributed': true}
          }
        });
        _options.addAll(getSeries(false));
        _options.addAll(getLabels(false));
        break;
      case 'line':
      case 'area':
        _options.addAll(<String, dynamic>{
          'chart': {'type': _type, 'events': getEvents()}
        });
        _options.addAll(getSeries(false));
        _options.addAll(getLabels(false));
        break;
      case 'pie':
      case 'donut':
        _options.addAll(<String, dynamic>{
          'chart': {'type': _type, 'events': getEvents()}
        });
        _options.addAll(getSeries(true));
        _options.addAll(getLabels(true));
        break;
      case 'radialBar':
        _options.addAll(<String, dynamic>{
          'chart': {'type': 'radialBar', 'events': getEvents()},
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
      case 'percentage':
        _options.addAll(<String, dynamic>{
          'chart': {
            'type': 'bar',
            'events': getEvents(),
            'height': 160,
            'stacked': true,
            'stackType': '100%',
            'toolbar': {'show': false}
          },
          'plotOptions': {
            'bar': {'horizontal': true}
          },
          'dataLabels': {
            'dropShadow': {'enabled': true}
          },
          'stroke': {'width': 0},
          'grid': {
            'show': false,
            'padding': {'top': 0, 'bottom': 0, 'right': 0, 'left': 0}
          },
          'fill': {
            'opacity': 1,
            'type': 'gradient',
            'gradient': <String, dynamic>{
              'shade': 'dark',
              'type': 'vertical',
              'shadeIntensity': 0.35,
              'inverseColors': false,
              'opacityFrom': 0.85,
              'opacityTo': 0.85,
              'stops': [90, 0, 100]
            }
          },
          'legend': {'position': 'top', 'horizontalAlign': 'right'},
          'xaxis': {
            'categories': ['Fav Color'],
            'labels': {'show': false},
            'axisBorder': {'show': false},
            'axisTicks': {'show': false}
          }
        });
        _options.addAll(<String, dynamic>{'series': _data.extSeries});
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
        <String, dynamic>{'name': '', 'data': _data.series}
      ]
    };
  }

  Map<String, dynamic> getLabels(bool simple) {
    if (simple) {
      return <String, dynamic>{'labels': _data.labels};
    }
    return <String, dynamic>{
      'xaxis': <String, dynamic>{'categories': _data.labels}
    };
  }

  Map<String, dynamic> getColors() {
    if (_data.colors.length > 0) {
      return <String, dynamic>{'colors': _data.colors};
    }
    return <String, dynamic>{};
  }

  Map<String, dynamic> getEvents() {
    return <String, dynamic>{'dataPointSelection': _data.drillToData};
  }
}
