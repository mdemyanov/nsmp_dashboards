import 'dart:html';

import 'package:naumen_smp_jsapi/naumen_smp_jsapi.dart';
import 'package:nsmp_dashboards/src/dashboard.dart';
//import 'package:nsmp_dashboards/src/mock_data.dart';

const String contentId = '#dashboard';
const String moduleCode = 'flatDashboard';
const String getDashboard = 'getDashboardData';

void main() async {
  String settings = SmpAPI.contentCode;
  String currentUid = SmpAPI.currentUUID;
  String selector = '#dashboard';
  String loading = '#loading';
  var de = querySelector(selector);
  var body = querySelector('body');

  String postUrl =
      '?func=modules.$moduleCode.$getDashboard&params=requestContent,user';
  if (settings == null) {
    querySelector(contentId).text =
        'Не удалось получить код контента Naumen SMP: это приложение должно быть встроено в интерфейс.';
    return;
  }
  Map<String,dynamic> dashboardData = await SmpAPI.execPost(
      postUrl, <String,String>{'settings': settings, 'source': currentUid});
//  Map<String, dynamic> dashboardData = await data();
  Dashboard dashboard = new Dashboard(settings, dashboardData);
  dashboard.render(selector);
  querySelector(loading).style.display = 'none';
  body.style.height = de.style.minHeight;
}
