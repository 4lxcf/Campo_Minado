import 'package:campo_minado/models/block.dart';
import 'package:flutter/material.dart';

class BlockWidget extends StatelessWidget {
  final Block? block;
  final Function(Block)? onOpenUp;
  final Function(Block)? onToggle;

  const BlockWidget({
    Key? key,
    @required this.block,
    @required this.onOpenUp,
    @required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpenUp!(block!),
      onLongPress: () => onToggle!(block!),
      child: _getImage(),
    );
  }

  Widget _getImage() {
    int qBombs = block!.minesQuantity;

    if (block!.open && block!.hasMine && block!.isExploded) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (block!.open && block!.hasMine) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (block!.open) {
      return Image.asset('assets/images/aberto_$qBombs.jpeg');
    } else if (block!.isMarked) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }
}
