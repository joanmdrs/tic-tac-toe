import 'package:flutter/material.dart';
import 'package:tictactoe/controllers/tic_tac_toe_controller.dart';
import 'package:tictactoe/enums/brand_enum.dart';

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
  int turn = 0;

  TicTacToeController controller = new TicTacToeController();
  String brand = "";
  String mark = "1";

  void _modifyState() {
    setState(() {
      if (turn == 0) {
        turn = 1;
      } else {
        turn = 0;
      }
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

  _buildBody(context) {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: _buildBoard(),
    );
  }

  _buildBoard() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      crossAxisCount: 3,
      children: List.generate(9, (index) {
        return Container(color: Colors.white, child: _buildMark(index));
      }),
    );
  }

  _buildMark(index) {
    return TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        onPressed: () {
          _modifyState();
          mark = "5";
        },
        child: Text(('$mark'), style: TextStyle(fontSize: 80)));
  }
}
