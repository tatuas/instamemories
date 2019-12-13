import 'package:flutter/material.dart';
import 'package:instamemories/ui/detail/page_detail.dart';
import 'package:instamemories/ui/main/page_home.dart';

void main() => runApp(InstamemoriesApp());

class InstamemoriesApp extends MaterialApp {
  @override
  String get title => "Instamemories";

  @override
  Widget get home => HomePage();

  @override
  String get initialRoute => '/';

  @override
  Map<String, WidgetBuilder> get routes =>
      {'/detail': (BuildContext context) => DetailPage()};
}
