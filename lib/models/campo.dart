import 'package:flutter/foundation.dart';
import 'explosion_exception.dart';

class Campo {
  final int? line;
  final int? column;
  final List<Campo> neighbors = [];
  bool _open = false;
  bool _isMarked = false;
  bool _hasMine = false;
  bool _isExploded = false;

  Campo({
    @required this.line,
    @required this.column,
  });
}
