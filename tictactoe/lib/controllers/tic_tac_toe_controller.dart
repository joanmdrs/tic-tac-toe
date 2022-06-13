import 'package:tictactoe/enums/brand_enum.dart';
import 'package:tictactoe/models/tic_tac_toe_model.dart';

class TicTacToeController {
  TicTacToeModel tictactoe = new TicTacToeModel();

  String markOnBoard(int pos, int state) {
    tictactoe.DecideTheTurn(state);
    tictactoe.mark(pos);
    Brand brand = tictactoe.brand;

    if (state == 1) {
      return "X";
    } else {
      return "O";
    }
  }
}
