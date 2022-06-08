class TicTacToe {
  Map<int, int> board = Map();
  int? currentPlayer;
  int? shot;

  TicTacToe(this.board, this.currentPlayer, this.shot);

  bool mark(int pos) {
    return true;
  }

  bool DecideTheTurn() {
    return true;
  }

  bool Finish() {
    return true;
  }

  int CheckTheWinner() {
    return 1;
  }
}
