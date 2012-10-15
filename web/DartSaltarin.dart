import 'dart:html';
import 'DartSaltarinLib.dart';

final int width = 480;
final int height = 320;

void main() {
  CanvasElement canvas = query("#gameCanvas");
  canvas.width = width;
  canvas.height = height;
  
  var context = canvas.context2d;
  new Game(context, width, height);
}