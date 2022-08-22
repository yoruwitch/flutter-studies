import 'dart:async';

void main() {
  print('Main');
  scheduleMicrotask(() => print('Microtask 1'));
  Future.delayed(Duration(seconds: 3), () => print('Future1 delayed'));
  Future.delayed(Duration(seconds: 3), () => print('Future2 delayed'));
  Future(() => print('Future3 delayed'));

  scheduleMicrotask((() => print('Printing second microtask')));

  print('Fim');
}
