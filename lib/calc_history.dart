class CalcHistory {

  static final List<History> history = List();

  static void clear() {
    history.clear();
  }

  static void add(String input, String output) {
    history.add(History(input, output));
  }

  static bool isEmpty() {
    return history.isEmpty;
  }

  static bool isNotEmpty() {
    return history.isNotEmpty;
  }

  static int length() {
    return history.length;
  }

  static History indexOf(int index) {
    return history.elementAt(index);
  }
}

class History {

  History(this.input, this.output);

  final String input;
  final String output;
}