import 'package:campo_minado/models/block.dart';
import 'package:flutter/material.dart';

class BlockWidget extends StatelessWidget {
  final Block? block;
  final Function(Block)? onOpenUp;
  final Function(Block)? onToggle;

  BlockWidget({
    @required this.block,
    @required this.onOpenUp,
    @required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpenUp!(block!),
      onLongPress: () => onToggle!(block!),
      child: _getImage(),
    );
  }

  Widget _getImage() {
    if (block!.open && block!.hasMine && block!.isExploded) {
      return Image.asset('assets/images/aberto_0.jpeg');
    } else {
      return Image.asset('assets/images/aberto_0.jpeg');
    }
  }
}
