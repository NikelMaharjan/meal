



import 'package:flutter/material.dart';

class LoadingUI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularProgressIndicator(
        color: Colors.grey,
      ),
    );
  }
}
