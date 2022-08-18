import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const GameApplication());
}

class GameApplication extends StatefulWidget {
  const GameApplication({Key? key}) : super(key: key);

  @override
  State<GameApplication> createState() => _GameApplicationState();
}

class _GameApplicationState extends State<GameApplication> {
  int top = 1;
  int bottom = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueAccent, Colors.greenAccent])),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Georgia'),
        home: Scaffold(
          appBar: getAppbar(),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image(
                    image: AssetImage('assets/images/$top.png'),
                    height: 200,
                    width: 390,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        top = Random().nextInt(3) + 1;
                        bottom = Random().nextInt(3) + 1;
                      });
                    },
                    child: Text(
                      'START',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: TextButton.styleFrom(
                      side: BorderSide(color: Colors.black12),
                      primary: Colors.white,
                      minimumSize: Size(200.0, 40.0),
                      shape: RoundedRectangleBorder(),
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/images/$bottom.png'),
                    height: 200,
                    width: 390,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget getAppbar() {
  return AppBar(
    centerTitle: true,
    shadowColor: Colors.grey,
    backgroundColor: Colors.blueGrey,
    title: Text('Rock Paper Scissors'),
  );
}
