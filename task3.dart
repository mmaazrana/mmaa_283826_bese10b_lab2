import 'dart:io';

void main() {
  Set<String> stringSet = {"Muhammad", "Maaz"};
  var intArr = [1, 2, 3, 4];
  if (intArr.length != stringSet.length) {
    if (intArr.length < stringSet.length) {
      while (intArr.length != stringSet.length) {
        intArr.add(0);
      }
    } else {
      while (intArr.length != stringSet.length) {
        intArr.removeLast();
      }
    }
  }
  print(stringSet);
  print(intArr);
}
