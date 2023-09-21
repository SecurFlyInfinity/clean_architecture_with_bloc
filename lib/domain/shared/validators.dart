class Validators{
  static bool containsOnlyWhitespace(String input) {
    return RegExp(r'^\s*$').hasMatch(input);
  }

  static bool phone(String input) {
    if(input.isNotEmpty && input.length!=10) {
      return false;
    }
    return num.tryParse(input) != null ? true : false;
  }

}