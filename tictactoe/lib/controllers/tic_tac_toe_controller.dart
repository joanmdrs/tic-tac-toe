import 'package:tictactoe/enums/brand_enum.dart';
import 'package:tictactoe/enums/players_enum.dart';
import 'package:tictactoe/models/tic_tac_toe_model.dart';
import 'package:flutter/material.dart';

class GameController {
  TicTacToeModel game = new TicTacToeModel();

  Map<int, String> GetBoard() => game.getBoard();
  GameController() {
    InitializeBoard();
  }

  void InitializeBoard() {
    game.InitializeBoard();
  }

  void reset() {
    InitializeBoard();
  }

  String returnWinner(int play) {
    return game.returnWinner(play);
  }

  int Mark(int pos, int state) {
    return game.Mark(pos, state);
  }
}
