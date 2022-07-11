import 'package:tictactoe/models/command.dart';

class UndoCommand implements Command {
  late Map<int, String> board;
  List<int> listPlays = List.empty(growable: true);

  UndoCommand(Map<int, String> board, List<int> listPlay) {
    this.board = board;
    this.listPlays = listPlay;
  }

  @override
  void execute() {
    if (this.listPlays.length != 0) {
      int pos = listPlays.removeLast();
      board[pos] = "";
    }
  }
}
