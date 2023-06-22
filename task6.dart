import 'dart:io';

class ContactBook {
  List<List<Object>> _dial;
  Map<String, String> _contacts;

  ContactBook()
      : _dial = [],
        _contacts = {};

  ContactBook.entries(List<List<Object>> dial, Map<String, String> contacts)
      : _dial = dial,
        _contacts = contacts;
  void add(String name, String number) {
    if (_dial.length == 10) {
      throw Exception('Contacts Full');
    }
    _contacts[name] = number;
    _dial[0].add(_dial[0].length);
    _dial[1].add(name);
  }

  void takeInput() {
    var input = stdin.readLineSync();
    if (input == null) {
      throw Exception("Invalid input provided");
    }
    var inputSplit = input.split(",");
    add(inputSplit.first, inputSplit.last);
  }

  String getNameFromDial(int number) =>
      _dial[1][_dial[0].indexOf(number)] as String;
  String getPhoneNumber(int number) => _contacts[getNameFromDial(number)]!;
  String getNameFromPhoneNumber(String phoneNumber) {
    try {
      return _contacts.map((key, value) => MapEntry(value, key))[phoneNumber]!;
    } catch (e) {
      return "Entry not found in contacts";
    }
  }
}

void main() {
  var dial = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [
      "Maaz",
      "Ahmad",
      "Saboor",
      "Shahzaib",
      "Hassaan",
      "Fatima",
      "Kainat",
      "Talal",
      "Fahad",
      "Ehtisham",
      "Huzaifa",
      "Taha"
    ]
  ];
  var phoneIndex = {
    "Maaz": "0314-8142090",
    "Ahmad": "0314-8142091",
    "Saboor": "0314-8142092",
    "Shahzaib": "0314-8142093",
    "Hassaan": "0314-8142094",
    "Fatima": "0314-8142095",
    "Kainat": "0314-8142096",
    "Talal": "0314-8142097",
    "Fahad": "0314-8142098",
    "Ehtisham": "0314-8142099",
    "Huzaifa": "0314-8142010",
    "Taha": "0314-8142020"
  };
  var contacts = ContactBook.entries(dial, phoneIndex);
  print(contacts.getNameFromDial(1));
  print(contacts.getNameFromPhoneNumber("0314-8142090"));
  print(contacts.getPhoneNumber(2));
}
