import 'package:dart_apex_charts/dart_apex_charts.dart';

import 'options.dart';

class Dashboard {
  static RegExp regTypeJig = new RegExp(r"#(\w+)");
  String settings;
  String type = 'line';
  String postUrl;
  Map<String, dynamic> dashboardData;
  ApexCharts chart;

  Dashboard(String settings, Map<String, dynamic> dashboardData) {
    this.settings = settings;
    this.dashboardData = dashboardData;
    Match type = regTypeJig.firstMatch(settings);
    if (type != null) {
      this.type = type[1];
    }
  }
  ApexCharts render(String selector) {
    Map<String, dynamic> options = Options(this.type, dashboardData).toMap();
    chart = ApexCharts(selector, options);
    chart.render();
    return chart;
  }
}
