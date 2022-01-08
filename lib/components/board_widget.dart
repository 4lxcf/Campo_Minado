import 'package:campo_minado/components/block_widget.dart';
import 'package:campo_minado/models/block.dart';
import 'package:campo_minado/models/board.dart';
import 'package:flutter/material.dart';

class BoardWidget extends StatelessWidget {
  final Board? board;
  final void Function(Block)? onOpenUp;
  final void Function(Block)? onToggle;

  // ignore: use_key_in_widget_constructors
  const BoardWidget({
    Key? key,
    @required this.board,
    @required this.onOpenUp,
    @required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: board!.columns!,
      children: board!.blocks
          .map(
            (e) => BlockWidget(
              block: e,
              onOpenUp: onOpenUp,
              onToggle: onToggle,
            ),
          )
          .toList(),
    );
  }
}
