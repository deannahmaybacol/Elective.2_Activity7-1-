import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      decoration: const BoxDecoration(color: Color(0xffdcffcc)),
      child: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '\nInfo',
                style: TextStyle(fontSize: 30, color: Colors.black54),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'The Hi-Lo Card Game is one of\n'
              'the best casino games for new players\n'
              'to look at due to how simple it is to play.\n\n'
              'All you need to do is guess whether the next\n'
              'card(right) to be dealt will be higher or \n'
              'lower than the show card(left)\n\n'
              'The Card suits rankings are : club(lowest), followed by \n'
              'diamonds, hearts, and spades (highest).\n\n'
              'Enjoy!',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
