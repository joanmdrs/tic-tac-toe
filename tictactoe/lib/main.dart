import 'package:flutter/material.dart';
import 'package:tictactoe/controllers/tic_tac_toe_controller.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int state = 1;
  GameController game = GameController();
  late Map<int, String> board = game.GetBoard();
  int play = 0;
  int currentTile = 5;
  String winner = "";

  void _modifyState(int pos) {
    setState(() {
      if (state == 0) {
        state = 1;
      } else {
        state = 0;
      }
      currentTile = pos;
      play = game.Mark(pos, state);
      winner = game.returnWinner(play);
    });
  }

  void _restart() {
    setState(() {
      state = 1;
      game.reset();
      board = game.GetBoard();
      play = 0;
      winner = "";
    });
  }

  void _undo() {
    setState(() {
      if (state == 0) {
        state = 1;
      } else {
        state = 0;
      }
      board[currentTile] = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                _restart();
              },
              tooltip: 'Restart',
              child: const Icon(Icons.restart_alt),
              backgroundColor: Colors.black,
            ),
            FloatingActionButton(
              onPressed: () {
                _undo();
              },
              tooltip: 'Undo',
              child: const Icon(Icons.undo),
              backgroundColor: Colors.black,
            )
            // FloatingActionButton(
            //   onPressed: (() => controller.reset()),
            //   tooltip: 'Undo',
            //   child: const Icon(Icons.undo),
            //   backgroundColor: Colors.black,
            // ),
          ],
        ));
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Tic Tac Toe'),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }

  _buildWinner() {
    return Center(
      child: Text(
        "winner: $winner",
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  _buildBody(context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.orangeAccent,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.shortestSide,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orangeAccent, width: 10.0)),
              child: _buildBoard(),
            ),
            Container(
              height: 367.636,
              width: MediaQuery.of(context).size.width,
              child: _buildWinner(),
            )
          ],
        ));
  }

  _buildBoard() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(0.0),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      crossAxisCount: 3,
      children: List.generate(9, (index) {
        int i = index;
        return Container(color: Colors.white, child: _buildMark(i));
      }),
    );
  }

  _buildMark(int index) {
    String? tile = board[index];
    return TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
        onPressed: () {
          _modifyState(index);
          currentTile = index;
        },
        child: Text(('$tile'),
            style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
              fontSize: 80.0,
              fontWeight: FontWeight.bold,
            ))));
  }
}
