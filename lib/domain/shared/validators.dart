class Validators{
  static bool containsOnlyWhitespace(String input) {
    return RegExp(r'^\s*$').hasMatch(input);
  }
}