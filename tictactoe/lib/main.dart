import 'package:flutter/material.dart';
import 'package:tictactoe/controllers/tic_tac_toe_controller.dart';
import 'package:tictactoe/enums/brand_enum.dart';
import 'package:tictactoe/models/tic_tac_toe_model.dart';

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
  String winner = "";

  void _modifyState(int pos) {
    setState(() {
      if (state == 0) {
        state = 1;
      } else {
        state = 0;
      }
      play = game.Mark(pos, state);
      winner = game.returnWinner(play);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Tic Tac Toe'),
      backgroundColor: Colors.black,
    );
  }

  _buildWinner(){
    return Center(
      child: Text(
        "winner: $winner",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  _buildBody(context) {
    return Column(
      children: [
      Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        child: _buildBoard(),
      ),
      Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: _buildWinner(),
      ),
    ]);
    
  }

  _buildBoard() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
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
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        onPressed: () {
          _modifyState(index);
        },
        child: Text(('$tile'), style: TextStyle(fontSize: 80)));
  }
}
