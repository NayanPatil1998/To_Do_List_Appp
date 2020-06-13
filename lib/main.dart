import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapplist/models/user.dart';
import 'package:todoapplist/screens/Wrapper.dart';
import 'package:todoapplist/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Wrapper(),
      ),
    );
  }
}
