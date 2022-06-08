import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:hilo_cardgame/widgets/custom_popup.dart';

class MainPage2 extends StatefulWidget {
  const MainPage2({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage2> {
  int nextCard = 0;
  int showCard = 0;
  String image1 = '';
  String image2 = '';
  String image3 = '';
  String image4 = '';
  String image5 = '';
  var count = 0;
  var score = 0;
  late FlipCardController _controller;
  late FlipCardController _control1;
  late FlipCardController _control2;
  late FlipCardController _control3;
  late FlipCardController _control4;
  late FlipCardController _control5;
  Map<String, int> deckCards = {
    'assets/AC.png': 1,
    'assets/AD.png': 1,
    'assets/AH.png': 1,
    'assets/AS.png': 1,
    'assets/2C.png': 2,
    'assets/2D.png': 2,
    'assets/2H.png': 2,
    'assets/2S.png': 2,
    'assets/3C.png': 3,
    'assets/3D.png': 3,
    'assets/3H.png': 3,
    'assets/3S.png': 3,
    'assets/4C.png': 4,
    'assets/4D.png': 4,
    'assets/4H.png': 4,
    'assets/4S.png': 4,
    'assets/5C.png': 5,
    'assets/5D.png': 5,
    'assets/5H.png': 5,
    'assets/5S.png': 5,
    'assets/6C.png': 6,
    'assets/6D.png': 6,
    'assets/6H.png': 6,
    'assets/6S.png': 6,
    'assets/7C.png': 7,
    'assets/7D.png': 7,
    'assets/7H.png': 7,
    'assets/7S.png': 7,
    'assets/8C.png': 8,
    'assets/8D.png': 8,
    'assets/8H.png': 8,
    'assets/8S.png': 8,
    'assets/9C.png': 9,
    'assets/9D.png': 9,
    'assets/9H.png': 9,
    'assets/9S.png': 9,
    'assets/10C.png': 10,
    'assets/10D.png': 10,
    'assets/10H.png': 10,
    'assets/10S.png': 10,
    'assets/JC.png': 11,
    'assets/JD.png': 11,
    'assets/JH.png': 11,
    'assets/JS.png': 11,
    'assets/QC.png': 12,
    'assets/QD.png': 12,
    'assets/QH.png': 12,
    'assets/QS.png': 12,
    'assets/KC.png': 13,
    'assets/KD.png': 13,
    'assets/KH.png': 13,
    'assets/KS.png': 13,
  };

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
    _control1 = FlipCardController();
    _control2 = FlipCardController();
    _control3 = FlipCardController();
    _control4 = FlipCardController();
    _control5 = FlipCardController();
    cardrandom();
  }

  void cardrandom() {
    Random random = Random();
    Random randoms = Random();
    int maxi = deckCards.length;
    int max = deckCards.length;
    setState(() {
      nextCard = random.nextInt(maxi);
      showCard = randoms.nextInt(max);
    });
  }

  void resetMode() {
    cardrandom();
    _controller.state?.controller?.reset();
  }

  void GuessedCards() {
    count;
    if (count == 1) {
      setState(() {
        _control1.state?.controller?.forward();
        image1 = deckCards.keys.elementAt(showCard);
      });
    } else if (count == 2) {
      setState(() {
        _control2.state?.controller?.forward();
        image2 = deckCards.keys.elementAt(showCard);
      });
    } else if (count == 3) {
      setState(() {
        _control3.state?.controller?.forward();
        image3 = deckCards.keys.elementAt(showCard);
      });
    } else if (count == 4) {
      setState(() {
        _control4.state?.controller?.forward();
        image4 = deckCards.keys.elementAt(showCard);
      });
    } else if (count == 5) {
      setState(() {
        _control5.state?.controller?.forward();
        image5 = deckCards.keys.elementAt(showCard);
      });
    } else if (count >= 6) {
      setState(() {
        count = 1;
        GuessedCards();
      });
    }
  }

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
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 250,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child:
                              Image.asset(deckCards.keys.elementAt(nextCard)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: FlipCard(
                              speed: 500,
                              controller: _controller,
                              flipOnTouch: false,
                              front: Container(
                                alignment: Alignment.center,
                                width: 250,
                                height: 150,
                                child: Image.asset('assets/Startstart.png'),
                              ),
                              back: Container(
                                alignment: Alignment.center,
                                width: 250,
                                height: 150,
                                child: Image.asset(
                                    deckCards.keys.elementAt(showCard)),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    children: <Widget>[
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(
                              () {
                                _controller.state?.controller?.forward();

                                if (deckCards.values.elementAt(nextCard) <=
                                    deckCards.values.elementAt(showCard)) {
                                  setState(() {
                                    count++;
                                    score++;
                                    GuessedCards();
                                    resetMode();
                                  });
                                } else {
                                  count = 0;
                                  score = 0;
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: const Color.fromARGB(
                                            255, 106, 154, 237),
                                        title: const Text('Game Over!'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: const <Widget>[
                                              Text('You Guessed wrong',
                                                  style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontFamily: 'IndieFlower',
                                                  )),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                resetMode();
                                                Navigator.popUntil(context,
                                                    (route) {
                                                  return route.settings.name ==
                                                      "/";
                                                });
                                              });
                                            },
                                            child: const Text(
                                              'Back to Home',
                                              style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontFamily: 'IndieFlower',
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 236, 113, 142)),
                            overlayColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 237, 27, 69)),
                          ),
                          child: const Text(
                            'High',
                            style: TextStyle(
                              color: Color.fromARGB(255, 3, 20, 12),
                              fontSize: 20,
                              fontFamily: 'IndieFlower',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 50),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(
                              () {
                                _controller.state?.controller?.forward();

                                if (deckCards.values.elementAt(nextCard) >=
                                    deckCards.values.elementAt(showCard)) {
                                  setState(() {
                                    count++;
                                    score++;
                                    GuessedCards();
                                    resetMode();
                                  });
                                } else {
                                  count = 0;
                                  score = 0;
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: const Color.fromARGB(
                                            255, 106, 154, 237),
                                        title: const Text('Game Over!'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: const <Widget>[
                                              Text('You Guessed wrong'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                resetMode();
                                                Navigator.popUntil(context,
                                                    (route) {
                                                  return route.settings.name ==
                                                      "/";
                                                });
                                              });
                                            },
                                            child: const Text(
                                              'Back to Home',
                                              style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontFamily: 'IndieFlower',
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 126, 204, 250)),
                            overlayColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 11, 51, 229)),
                          ),
                          child: const Text(
                            'Low',
                            style: TextStyle(
                              color: Color.fromARGB(255, 3, 20, 12),
                              fontSize: 20,
                              fontFamily: 'IndieFlower',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Guessed Cards: $score',
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white70,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(0.5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 200,
                              width: 900,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                    Color.fromARGB(255, 62, 30, 241),
                                    Color.fromARGB(255, 111, 38, 179),
                                  ])),
                              child: Row(children: <Widget>[
                                Wrap(
                                  children: <Widget>[
                                    SizedBox(
                                      child: FlipCard(
                                          speed: 500,
                                          controller: _control1,
                                          flipOnTouch: false,
                                          front: Container(
                                            alignment: Alignment.center,
                                            width: 180,
                                            height: 150,
                                            child:
                                                Image.asset('assets/start.png'),
                                          ),
                                          back: Container(
                                            alignment: Alignment.center,
                                            height: 180,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Image.asset(image1),
                                          )),
                                    ),
                                    SizedBox(
                                      child: FlipCard(
                                          speed: 500,
                                          controller: _control2,
                                          flipOnTouch: false,
                                          front: Container(
                                            alignment: Alignment.center,
                                            width: 180,
                                            height: 150,
                                            child:
                                                Image.asset('assets/start.png'),
                                          ),
                                          back: Container(
                                            alignment: Alignment.center,
                                            height: 180,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Image.asset(image2),
                                          )),
                                    ),
                                    SizedBox(
                                      child: FlipCard(
                                          speed: 500,
                                          controller: _control3,
                                          flipOnTouch: false,
                                          front: Container(
                                            alignment: Alignment.center,
                                            width: 180,
                                            height: 150,
                                            child:
                                                Image.asset('assets/start.png'),
                                          ),
                                          back: Container(
                                            alignment: Alignment.center,
                                            height: 180,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Image.asset(image3),
                                          )),
                                    ),
                                    SizedBox(
                                      child: FlipCard(
                                          speed: 500,
                                          controller: _control4,
                                          flipOnTouch: false,
                                          front: Container(
                                            alignment: Alignment.center,
                                            width: 180,
                                            height: 150,
                                            child:
                                                Image.asset('assets/start.png'),
                                          ),
                                          back: Container(
                                            alignment: Alignment.center,
                                            height: 180,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Image.asset(image4),
                                          )),
                                    ),
                                    SizedBox(
                                      child: FlipCard(
                                          speed: 500,
                                          controller: _control5,
                                          flipOnTouch: false,
                                          front: Container(
                                            alignment: Alignment.center,
                                            width: 180,
                                            height: 150,
                                            child:
                                                Image.asset('assets/start.png'),
                                          ),
                                          back: Container(
                                            alignment: Alignment.center,
                                            height: 180,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Image.asset(image5),
                                          )),
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              child: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        const CustomPopUp(),
      ],
    );
  }
}
