import 'package:campo_minado/components/board_widget.dart';
import 'package:campo_minado/models/block.dart';
import 'package:campo_minado/models/board.dart';
import 'package:flutter/material.dart';
import '../components/result_widget.dart';

class MinefieldApp extends StatelessWidget {
  Block block = Block(line: 0, column: 0);

  MinefieldApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const ResultWidget(
          won: null,
          onRestart: null,
        ),
        body: BoardWidget(
          board: Board(
            lines: 15,
            columns: 15,
            qBombs: 0,
          ),
          onOpenUp: _onOpenUp,
          onToggle: _onToggle,
        ),
      ),
    );
  }

  _onOpenUp(Block b) {}

  _onToggle(Block b) {}
}
