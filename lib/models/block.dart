import 'package:flutter/foundation.dart';
import 'explosion_exception.dart';

class Block {
  final int? line;
  final int? column;
  final List<Block> neighbors = [];
  bool _open = false;
  bool _isMarked = false;
  bool _hasMine = false;
  bool _isExploded = false;

  Block({
    @required this.line,
    @required this.column,
  });

  void addNeighbor(Block neighbor) {
    final deltaLine = (line! - neighbor.line!).abs();
    final deltaColumn = (column! - neighbor.column!).abs();

    if (deltaLine == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaLine <= 1 && deltaColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  void openUp() {
    if (_open) {
      return;
    }

    _open = true;

    if (_hasMine) {
      _isExploded = true;
      throw ExplosionException();
    }

    if (safeNeighborhood) {
      for (var element in neighbors) {
        element.openUp();
      }
    }
  }

  void revealBombs() {
    if (_hasMine) {
      _open = true;
    }
  }

  void mine() {
    _hasMine = true;
  }

  void toggleMark() {
    _isMarked = !_isMarked;
  }

  void restart() {
    _open = false;
    _isMarked = false;
    _hasMine = false;
    _isExploded = false;
  }

  bool get hasMine {
    return _hasMine;
  }

  bool get isExploded {
    return _isExploded;
  }

  bool get open {
    return _open;
  }

  bool get isMarked {
    return _isMarked;
  }

  bool get solved {
    bool hasMineAndMarked = hasMine && isMarked;
    bool safeAndOpen = !hasMine && open;

    return hasMineAndMarked || safeAndOpen;
  }

  bool get safeNeighborhood {
    return neighbors.every((n) => !n.hasMine);
  }

  int get minesQuantity {
    return neighbors.where((element) => element._hasMine).length;
  }
}
