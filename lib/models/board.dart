import 'dart:math';

import 'package:campo_minado/models/block.dart';
import 'package:flutter/cupertino.dart';

import 'block.dart';

class Board {
  final int? lines;
  final int? columns;
  final int? qBombs;

  final List<Block> _blocks = [];

  Board({
    @required this.lines,
    @required this.columns,
    @required this.qBombs,
  }) {
    _createBlocks();
    _relateNeighbors();
    _drawMines();
  }

  void restart() {
    for (var element in _blocks) {
      element.restart();
    }
    _drawMines();
  }

  void revealBombs() {
    for (var element in _blocks) {
      element.revealBombs();
    }
  }

  void _createBlocks() {
    for (var l = 0; l < lines!; l++) {
      for (var c = 0; c < columns!; c++) {
        _blocks.add(Block(line: l, column: c));
      }
    }
  }

  void _relateNeighbors() {
    for (var block in _blocks) {
      for (var neighbor in _blocks) {
        block.addNeighbor(neighbor);
      }
    }
  }

  void _drawMines() {
    int drawn = 0;

    if (qBombs! > lines! * columns!) {
      return;
    }

    while (drawn < qBombs!) {
      int i = Random().nextInt(_blocks.length);

      if (!_blocks[i].hasMine) {
        drawn++;
        _blocks[i].mine();
      }
    }
  }

  List<Block> get blocks {
    return _blocks;
  }

  bool get solved {
    return _blocks.every((element) => element.solved);
  }
}
