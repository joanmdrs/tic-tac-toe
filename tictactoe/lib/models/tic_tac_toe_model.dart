import 'package:flutter/widgets.dart';
import 'package:tictactoe/enums/brand_enum.dart';
import 'package:tictactoe/enums/players_enum.dart';

class TicTacToeModel {
  Map<int, String> board = new Map();
  late Brand currentBrand;
  late Player currentPlayer;

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
    if(board[0] ==  board[1] && board[0] ==  board[2] && board[0] != null){
      return true;
    } else if(board[0] == board[3] && board[0] == board[6] && board[0] != null){
      return true;
    } else if(board[0] == board[4] && board[0] == board[8] && board[0] != null){
      return true;
    } else if(board[1] == board[4] && board[1] == board[7] && board[1] != null){
      return true;
    } else if(board[2] == board[5] && board[2] == board[8] && board[2] != null){
      return true;
    } else if(board[2] == board[4] && board[2] == board[6] && board[2] != null){
      return true;
    } else if(board[3] == board[4] && board[3] == board[5] && board[3] != null){
      return true;
    } else if(board[6] == board[7] && board[6] == board[8] && board[6] != null){
      return true;
    } else {
      return false;
    }
  }

  int CheckTheWinner() {
    if(Player.player1 == currentPlayer){
      return 2;
    } else {
      return 1;
    }
  }
}
