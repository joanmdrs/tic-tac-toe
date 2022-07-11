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
    game.board[0] = "";
    game.board[1] = "";
    game.board[2] = "";
    game.board[3] = "";
    game.board[4] = "";
    game.board[5] = "";
    game.board[6] = "";
    game.board[7] = "";
    game.board[8] = "";
    game.contador = 0;
  }

  void reset() {
    InitializeBoard();
  }

  String returnWinner(int play) {
    if (play == 1 && game.Finish() == true) {
      return "Vencedor: Jogador O!!";
    } else if (play == 2 && game.Finish() == true) {
      return "Vencedor: Jogador X!!";
    } else if (play == 0) {
      return "Empate!!";
    }
    return "";
  }

  int Mark(int pos, int state) {
    if(game.Finish() == false){
      game.DecideTheTurn(state);
      bool checkPos = game.CheckPosition(pos);
      if (checkPos == true) {
        game.MarkOnBoard(pos);
        if (game.Finish() == true) {
          return game.CheckTheWinner();
        } else if (game.Finish() == false && game.CheckVelha() == true) {
          return 0;
        }
      }
    }
    return -1;
  }
}
