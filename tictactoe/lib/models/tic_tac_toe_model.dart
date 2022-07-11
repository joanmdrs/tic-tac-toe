import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tictactoe/enums/brand_enum.dart';
import 'package:tictactoe/enums/players_enum.dart';

class TicTacToeModel {
  Map<int, String> board = new Map();
  late Brand currentBrand;
  late Player currentPlayer;
  int contador = 0;

  Map<int, String> getBoard() => board;

  void MarkOnBoard(int pos) {
    if (currentBrand == Brand.XIS) {
      board[pos] = "X";
      contador++;
    } else if (currentBrand == Brand.BOLA) {
      board[pos] = "O";
      contador++;
    }
  }

  void DecideTheTurn(int state) {
    if (state == 0) {
      currentBrand = Brand.XIS;
      currentPlayer = Player.player1;
    } else {
      currentBrand = Brand.BOLA;
      currentPlayer = Player.player2;
    }
  }

  bool CheckPosition(int pos) {
    if (board[pos] == "X" || board[pos] == "O") {
      return false;
    }
    return true;
  }

  bool CheckVelha() {
    if (contador >= 8 && Finish() == false) {
      return true;
    }
    return false;
  }

  bool Finish() {
    if (board[0] == board[1] && board[0] == board[2] && board[0] != "") {
      return true;
    } else if (board[0] == board[3] && board[0] == board[6] && board[0] != "") {
      return true;
    } else if (board[0] == board[4] && board[0] == board[8] && board[0] != "") {
      return true;
    } else if (board[1] == board[4] && board[1] == board[7] && board[1] != "") {
      return true;
    } else if (board[2] == board[5] && board[2] == board[8] && board[2] != "") {
      return true;
    } else if (board[2] == board[4] && board[2] == board[6] && board[2] != "") {
      return true;
    } else if (board[3] == board[4] && board[3] == board[5] && board[3] != "") {
      return true;
    } else if (board[6] == board[7] && board[6] == board[8] && board[6] != "") {
      return true;
    } else {
      return false;
    }
  }

  int CheckTheWinner() {
    if (Player.player1 == currentPlayer) {
      return 2;
    } else if (Player.player2 == currentPlayer) {
      return 1;
    } else {
      return 0;
    }
  }
}
