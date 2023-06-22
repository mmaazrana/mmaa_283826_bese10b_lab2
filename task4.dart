import 'dart:io';

void main() {
  Set<String> stringSet = {"Muhammad", "Maaz"};
  var intArr = [1, 2, 3, 4];
  var map = new Map();
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

  for (int i = 0; i < intArr.length; i++) {
    map[intArr[i]] = stringSet.elementAt(i);
  }
  print(map);
  map = map.map((key, value) => MapEntry(value, key));
  print(map);
}
