class CheckerWinnerService {
  /// Possíveis vitórias
  List<List<int>> wins = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  bool isWinner(List<int> moves) {
    /// Verifica se na lista de movimentos há uma possivel
    /// jogada de vítoria, caso satisfaça essa condição retorna true
    return wins.any((index) =>
        moves.contains(index[0]) &&
        moves.contains(index[1]) &&
        moves.contains(index[2]));
  }
}
