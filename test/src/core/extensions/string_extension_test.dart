import 'package:flutter_test/flutter_test.dart';
import 'package:sample_project/src/core/extensions/string_extension.dart';

void main() {
  test('nullIfBlankOrTrim', () {
    expect(''.nullIfBlankOrTrim, null);
    expect('   '.nullIfBlankOrTrim, null);
    expect('a'.nullIfBlankOrTrim, 'a');
    expect('a '.nullIfBlankOrTrim, 'a');
    expect(' a'.nullIfBlankOrTrim, 'a');
  });
}
