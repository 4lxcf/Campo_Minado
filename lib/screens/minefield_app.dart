import 'package:campo_minado/components/block_widget.dart';
import 'package:campo_minado/models/block.dart';
import 'package:flutter/material.dart';
import '../components/result_widget.dart';

class MinefieldApp extends StatelessWidget {
  Block block = Block(line: 0, column: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: null,
          onRestart: null,
        ),
        body: Container(
          child: BlockWidget(
            block: block,
            onOpenUp: _onOpenUp,
            onToggle: _onToggle,
          ),
        ),
      ),
    );
  }

  _onOpenUp(Block b) {}

  _onToggle(Block b) {}
}
