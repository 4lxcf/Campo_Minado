import 'package:flutter_test/flutter_test.dart';
import 'package:campo_minado/models/board.dart';

main() {
  test('Ganhar Jogo', () {
    Board board = Board(
      lines: 2,
      columns: 2,
      qBombs: 0,
    );

    board.blocks[0].mine();
    board.blocks[3].mine();

    //Playing
    board.blocks[0].toggleMark();
    board.blocks[1].openUp();
    board.blocks[2].openUp();
    board.blocks[3].toggleMark();
  });
}
