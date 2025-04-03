import 'package:flutter_project_structure/helper/extension/int_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should Return word count', () {
    expect(1.getWordCountText(), equals('1 word'));
    expect(2.getWordCountText(), equals('2 words'));
    expect(0.getWordCountText(), equals('0 word'));
  });

  test('Should Return suffix st, nd, rd, th etc..', () {
    expect(1.getSuffix(), equals('st'));
    expect(2.getSuffix(), equals('nd'));
    expect(3.getSuffix(), equals('rd'));
    expect(4.getSuffix(), equals('th'));
  });
}
