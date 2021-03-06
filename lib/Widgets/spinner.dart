import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todoapplist/constants.dart';

class SpinnerWidget extends StatelessWidget {
  const SpinnerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitFoldingCube(
          color: kPrimaryColor,
          size: 50,
        ),
      ),
    );
  }
}
