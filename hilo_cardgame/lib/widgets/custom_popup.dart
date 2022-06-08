import 'package:flutter/material.dart';

import 'custom_dialog.dart';

class CustomPopUp extends StatelessWidget {
  const CustomPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 40,
          width: 40,
          child: MaterialButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => const CustomDialog(),
              );
            },
            elevation: 3.0,
            color: const Color(0xffdcffcc),
            shape: const CircleBorder(),
            child: const Center(
              child: Text(
                'i',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
