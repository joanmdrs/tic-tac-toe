import 'package:tictactoe/enums/brand_enum.dart';
import 'package:tictactoe/enums/players_enum.dart';

class TicTacToeModel {
  late Map<int, Brand> board = new Map();
  late Brand brand;
  late Player currentPlayer;

  bool mark(int pos) {
    if (pos == 0) {
      board[1] = brand;
    } else if (pos == 1) {
      board[2] = brand;
    } else if (pos == 2) {
      board[3] = brand;
    } else if (pos == 3) {
      board[4] = brand;
    } else if (pos == 4) {
      board[5] = brand;
    } else if (pos == 5) {
      board[6] = brand;
    } else if (pos == 6) {
      board[7] = brand;
    } else if (pos == 7) {
      board[8] = brand;
    } else if (pos == 8) {
      board[9] = brand;
    }

    return true;
  }

  void DecideTheTurn(int state) {
    if (state == 0) {
      currentPlayer = Player.player1;
      brand = Brand.XIS;
    }
    currentPlayer = Player.player2;
    brand = Brand.BOLA;
  }

  bool Finish() {
    return true;
  }

  int CheckTheWinner() {
    return 1;
  }
}
