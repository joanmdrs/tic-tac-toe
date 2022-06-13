import 'package:flutter/widgets.dart';
import 'package:tictactoe/enums/brand_enum.dart';
import 'package:tictactoe/enums/players_enum.dart';

class TicTacToeModel {
  Map<int, String> board = new Map();
  late Brand currentBrand;

  Map<int, String> getBoard() => board;

  void MarkOnBoard(int pos) {
    if (currentBrand == Brand.XIS) {
      board[pos] = "X";
    } else if (currentBrand == Brand.BOLA) {
      board[pos] = "O";
    }
  }

  void DecideTheTurn(int state) {
    if (state == 0) {
      currentBrand = Brand.XIS;
    } else {
      currentBrand = Brand.BOLA;
    }
  }

  bool CheckPosition(int pos) {
    if (board[pos] == "X" || board[pos] == "O") {
      return false;
    }
    return true;
  }

  bool Finish() {
    return true;
  }

  int CheckTheWinner() {
    return 1;
  }
}
