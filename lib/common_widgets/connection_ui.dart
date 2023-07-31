


import 'package:flutter/material.dart';


class ConnectionUI extends StatelessWidget {

  VoidCallback onTap;
  ConnectionUI(this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Connection problem"),
          ),
          SizedBox(
            height: 40,
            child: OutlinedButton(
              onPressed: onTap,
              child: Text("Retry", style: TextStyle(color: Colors.grey),),

            ),
          ),
        ],
      ),
    );
  }
}