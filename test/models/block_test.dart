import 'package:campo_minado/models/block.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Block', () {
    test('Open block WITH explosion', () {
      Block b = Block(line: 0, column: 0);
      b.mine();

      expect(b.openUp, throwsException);
    });

    test('Open block WITHOUT explosion', () {
      Block b = Block(line: 0, column: 0);
      b.openUp();

      expect(b.open, isTrue);
    });

    test('Add a NO neighbor', () {
      Block b1 = Block(line: 0, column: 0);
      Block b2 = Block(line: 1, column: 3);
      b1.addNeighbor(b2);

      expect(b1.neighbors.isEmpty, isTrue);
    });

    test('Add a neighbor', () {
      Block b1 = Block(line: 1, column: 1);
      Block b2 = Block(line: 0, column: 0);
      Block b3 = Block(line: 2, column: 2);
      Block b4 = Block(line: 1, column: 2);
      b1.addNeighbor(b2);
      b1.addNeighbor(b3);
      b1.addNeighbor(b4);

      expect(b1.neighbors.length, 3);
    });
  });
}
