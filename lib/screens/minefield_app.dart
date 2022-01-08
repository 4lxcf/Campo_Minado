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
  Board? _board;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: _won,
          onRestart: _restart,
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return BoardWidget(
                board: _setBoard(
                  constraints.maxHeight,
                  constraints.maxWidth,
                ),
                onOpenUp: _onOpenUp,
                onToggle: _onToggle,
              );
            },
          ),
        ),
      ),
    );
  }

  _onOpenUp(Block b) {
    if (_won == null) {
      setState(() {
        try {
          b.openUp();
          if (_board!.solved) {
            _won = true;
          }
        } on ExplosionException {
          _won = false;
          _board!.revealBombs();
        }
      });
    }
  }

  _onToggle(Block b) {
    if (_won == null) {
      setState(() {
        b.toggleMark();
        if (_board!.solved) {
          _won = true;
        }
      });
    }
  }

  _restart() {
    setState(() {
      _won = null;
      _board!.restart();
    });
  }

  _setBoard(double height, double width) {
    if (_board == null) {
      int columns = 15;
      double blockSize = width / columns;
      int lines = (height / blockSize).floor();

      _board = Board(
        lines: lines,
        columns: columns,
        qBombs: 5,
      );
    }
    return _board;
  }
}
