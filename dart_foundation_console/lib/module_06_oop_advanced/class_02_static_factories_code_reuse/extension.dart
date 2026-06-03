// Extension allows us to add custom methods to existing types.
// Here, we add parseInt() method to String.
extension on String {
  int parseInt() {
    return int.parse(this);
  }
}

void main() {
  String numberString = "42";

  // Usage: The method appears as if it belongs to the String class
  print(numberString.parseInt());
}