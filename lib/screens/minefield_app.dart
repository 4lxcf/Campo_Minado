import 'package:campo_minado/components/board_widget.dart';
import 'package:campo_minado/models/block.dart';
import 'package:campo_minado/models/board.dart';
import 'package:campo_minado/models/explosion_exception.dart';
import 'package:flutter/material.dart';
import '../components/result_widget.dart';

class MinefieldApp extends StatefulWidget {
  const MinefieldApp({Key? key}) : super(key: key);

  @override
  State<MinefieldApp> createState() => _MinefieldAppState();
}

class _MinefieldAppState extends State<MinefieldApp> {
  bool? _won;
  Board board = Board(
    lines: 15,
    columns: 15,
    qBombs: 5,
  );

  Block block = Block(line: 0, column: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: _won,
          onRestart: _restart,
        ),
        body: BoardWidget(
          board: board,
          onOpenUp: _onOpenUp,
          onToggle: _onToggle,
        ),
      ),
    );
  }

  _onOpenUp(Block b) {
    if (_won == null) {
      setState(() {
        try {
          b.openUp();
          if (board.solved) {
            _won = true;
          }
        } on ExplosionException {
          _won = false;
          board.revealBombs();
        }
      });
    }
  }

  _onToggle(Block b) {
    if (_won == null) {
      setState(() {
        b.toggleMark();
        if (board.solved) {
          _won = true;
        }
      });
    }
  }

  _restart() {
    setState(() {
      _won = null;
      board.restart();
    });
  }
}
