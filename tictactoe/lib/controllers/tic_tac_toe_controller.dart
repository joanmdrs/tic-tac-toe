import 'package:tictactoe/enums/brand_enum.dart';
import 'package:tictactoe/models/tic_tac_toe_model.dart';

class GameController {
  TicTacToeModel game = new TicTacToeModel();

  Map<int, String> GetBoard() => game.getBoard();
  GameController(){
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
  }

  bool Mark(int pos, int state) {
    game.DecideTheTurn(state);
    bool checkPos = game.CheckPosition(pos);
    if (checkPos == true) {
      game.MarkOnBoard(pos);
      return true;
    } else {
      return false;
    }
  }
}
