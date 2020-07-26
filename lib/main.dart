import 'package:dwu_project/pages/login_page.dart';
import 'package:dwu_project/pages/register_page.dart';
import 'package:dwu_project/pages/user_list_page.dart';
import 'package:dwu_project/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto DWU',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      routes: {
        AppRotas.HOME_PAGE: (ctx) => LoginPage(),
        AppRotas.REGISTER_PAGE: (ctx) => RegisterPage(),
        AppRotas.REGISTER_LIST_PAGE: (ctx) => UserListPage(),
      },
    );
  }
}
