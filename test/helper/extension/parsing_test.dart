import 'package:flutter_project_structure/helper/extension/parsing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Convert any to int', () {
    expect(23.50.intFrom(), 23);
  });
}
