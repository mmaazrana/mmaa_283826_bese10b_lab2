import 'dart:io';

void main() {
  print("Enter your name: ");
  String? name = stdin.readLineSync();
  if (name == null || name == "") {
    return print("Hello, Guest, Welcome to Flutter");
  }
  print("Hello, $name, Welcome to Flutter");
}
