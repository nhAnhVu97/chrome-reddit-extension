import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

const indexNotFound = -1;

class DateInputFormatter extends TextInputFormatter {
  final String _placeholder = 'DD/MM/YYYY';
  TextEditingValue? _lastNewValue;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (oldValue.text.isEmpty) {
      oldValue.copyWith(text: _placeholder);
      final v = newValue.copyWith(
        text: _fillInputToPlaceholder(newValue.text),
      );
      return v;
    }

    if (newValue == _lastNewValue) {
      return oldValue;
    }
    _lastNewValue = newValue;

    int offset = newValue.selection.baseOffset;

    if (offset > 10) {
      return oldValue;
    }

    if (oldValue.text == newValue.text && oldValue.text.isNotEmpty) {
      return newValue;
    }

    final String oldText = oldValue.text;
    final String newText = newValue.text;
    String? resultText;

    int index = _indexOfDifference(newText, oldText);
    if (oldText.length < newText.length) {
      final String newChar = newText[index];
      if (index == 2 || index == 5) {
        index++;
        offset++;
      }
      resultText = oldText.replaceRange(index, index + 1, newChar);
      if (offset == 2 || offset == 5) {
        offset++;
      }
    } else if (oldText.length > newText.length) {
      if (oldText[index] != '/') {
        resultText = oldText.replaceRange(index, index + 1, '-');
        if (offset == 3 || offset == 6) {
          offset--;
        }
      } else {
        resultText = oldText;
      }
    }

    final splashes = resultText!.replaceAll(RegExp('[^/]'), '');
    final int count = splashes.length;
    if (resultText.length > 10 || count != 2 || resultText[2] != '/' || resultText[5] != '/') {
      return oldValue;
    }

    return oldValue.copyWith(
      text: resultText,
      selection: TextSelection.collapsed(offset: offset),
      composing: defaultTargetPlatform == TargetPlatform.iOS ? const TextRange(start: 0, end: 0) : TextRange.empty,
    );
  }

  int _indexOfDifference(String? cs1, String? cs2) {
    if (cs1 == cs2) {
      return indexNotFound;
    }
    if (cs1 == null || cs2 == null) {
      return 0;
    }
    int i;
    for (i = 0; i < cs1.length && i < cs2.length; ++i) {
      if (cs1[i] != cs2[i]) {
        break;
      }
    }
    if (i < cs2.length || i < cs1.length) {
      return i;
    }
    return indexNotFound;
  }

  String _fillInputToPlaceholder(String? input) {
    if (input == null || input.isEmpty) {
      return _placeholder;
    }
    String result = _placeholder;
    final index = [0, 1, 3, 4, 6, 7, 8, 9];
    final length = min(index.length, input.length);
    for (int i = 0; i < length; i++) {
      result = result.replaceRange(index[i], index[i] + 1, input[i]);
    }
    return result;
  }
}
