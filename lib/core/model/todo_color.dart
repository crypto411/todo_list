import 'dart:ui';

class TodoColor {
  late Color color;
  late bool selected;

  TodoColor(this.color, {bool selected = false}) {
    this.selected = selected;
  }
}