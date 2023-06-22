import 'dart:io';

String greetUser(String? name) {
  if (name == null || name == "") {
    return "Hello, Guest, Welcome to Flutter";
  }
  return "Hello, $name, Welcome to Flutter";
}

void main() {
  print("Enter your name: ");
  String? name = stdin.readLineSync();
  print(greetUser(name));
}
