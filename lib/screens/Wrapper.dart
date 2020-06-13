import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapplist/Widgets/Authenticate.dart';
import 'package:todoapplist/models/user.dart';
import 'package:todoapplist/screens/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user == null)
    return Authenticate();
    else
    return HomeScreen();
  }
}
