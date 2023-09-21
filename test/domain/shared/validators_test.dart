

import 'package:architecture/domain/shared/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){


  group("Validators Unit Testing", () {

    test("Should not be any whitespace or blank String", () {
      // arrange
      String value = "Shubham Rao";
      // act
      final result = Validators.containsOnlyWhitespace(value);

      // assert
      expect(result, false);
    });

    test("Phone number should be 10 digits and numeric values", () {
      // arrange
      String value = "9876543210";

      // act
      final result = Validators.phone(value);

      // assert
      expect(result, true);
    });
  });

}