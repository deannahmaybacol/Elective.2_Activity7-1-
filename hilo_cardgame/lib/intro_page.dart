import 'package:flutter/material.dart';
import 'package:hilo_cardgame/main_page2.dart';
import 'package:hilo_cardgame/widgets/custom_popup.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromARGB(255, 62, 30, 241),
                      Color.fromARGB(255, 102, 33, 157),
                      Color.fromARGB(255, 179, 116, 38)
                    ]),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'HI-LO Card Game',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'IndieFlower',
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 100,
                  child: Image(
                    image: AssetImage('assets/Deckcards.png'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '\n\n'
                  '      This site lets you play\n'
                  'the simple High and Low Card Game',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'IndieFlower',
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 240, 168, 105)),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Play',
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 20, 12),
                        fontFamily: 'IndieFlower',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, SlideRightRoute(page: const MainPage2()));
                    },
                  ),
                ),
                const SizedBox(height: 100),
                const Text(
                  'Deannah May P. Bacol       BSCpE 3-A',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'IndieFlower',
                  ),
                ),
              ],
            ),
          ),
        ),
        // this is custom built widget button for pop up.
        const CustomPopUp()
      ],
    );
  }
}

// transition class for overriding defalut material transition

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
