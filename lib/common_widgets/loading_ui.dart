



import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingUI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitRipple(
        color: Colors.grey,
        size: 60,
      ),
    );
  }
}
