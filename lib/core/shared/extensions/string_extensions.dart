extension NullableStringIsNullOrEmptyExtension on String? {
  /// Checks if the `String` is Blank (null, empty or only white spaces).
  bool get isBlank => this?.trim().isEmpty ?? true;

  /// Checks if the `String` is not blank (null, empty or only white spaces).
  bool get isNotBlank => isBlank == false;

  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isUrl => Uri.parse(this!).isAbsolute;

  String? before(String pattern) {
    if (isBlank) {
      return this;
    }

    if (!this!.contains(pattern)) {
      return '';
    }

    final List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    final int indexOfFirstPatternWord = this!.indexOf(patternWords.first);

    if (patternWords.last.isEmpty) {
      return '';
    }

    return this!.substring(
      0,
      indexOfFirstPatternWord,
    );
  }

  String? after(String pattern) {
    if (isBlank) {
      return this;
    }

    if (!this!.contains(pattern)) {
      return '';
    }

    final List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    final int indexOfLastPatternWord = this!.indexOf(patternWords.last);

    if (patternWords.last.isEmpty) {
      return '';
    }

    return this!.substring(indexOfLastPatternWord + patternWords.last.length, this!.length);
  }

  bool isVideo(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".mp4") ||
        ext.endsWith(".avi") ||
        ext.endsWith(".wmv") ||
        ext.endsWith(".rmvb") ||
        ext.endsWith(".mpg") ||
        ext.endsWith(".mpeg") ||
        ext.endsWith(".3gp");
  }

  /// Checks if string is an audio file.
  bool isAudio(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".mp3") || ext.endsWith(".wav") || ext.endsWith(".wma") || ext.endsWith(".amr") || ext.endsWith(".ogg");
  }

  /// Checks if string is an image file.
  bool isImage(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".jpg") || ext.endsWith(".jpeg") || ext.endsWith(".png") || ext.endsWith(".gif") || ext.endsWith(".bmp");
  }
}

const _ascii = 0x007f;
const _latin1 = 0x00ff;

extension StringCapitalizeExtension on String {
  /// Returns a copy of this string having its first letter uppercased, or the
  /// original string, if it's empty or already starts with an upper case
  /// letter.
  ///
  /// ```dart
  /// print('abcd'.capitalize()) // Abcd
  /// print('Abcd'.capitalize()) // Abcd
  /// ```
  String capitalize() {
    switch (length) {
      case 0:
        return this;
      case 1:
        return toUpperCase();
      default:
        return substring(0, 1).toUpperCase() + substring(1);
    }
  }
}

extension StringDecapitalizeExtension on String {
  /// Returns a copy of this string having its first letter lowercased, or the
  /// original string, if it's empty or already starts with a lower case letter.
  ///
  /// ```dart
  /// print('abcd'.decapitalize()) // abcd
  /// print('Abcd'.decapitalize()) // abcd
  /// ```
  String decapitalize() {
    switch (length) {
      case 0:
        return this;
      case 1:
        return toLowerCase();
      default:
        return substring(0, 1).toLowerCase() + substring(1);
    }
  }
}

extension StringIsBlankExtension on String {
  /// Returns `true` if this string is empty or consists solely of whitespace
  /// characters.
  bool get isBlank => trimLeft().isEmpty;
}

extension StringIsNotBlankExtension on String {
  /// Returns `true` if this char sequence is not empty and contains some
  /// characters except of whitespace characters.
  bool get isNotBlank => !isBlank;
}

extension StringIsUpperCaseExtension on String {
  /// Returns `true` if the whole string is upper case.
  ///
  /// ```dart
  /// 'HI'.isUpperCase // true
  /// 'Hi'.isUpperCase // false
  /// '!'.isUpperCase // false
  /// 'HEY, YOU!'.isUpperCase // true
  /// ```
  bool get isUpperCase => this == toUpperCase() && this != toLowerCase();
}

extension StringIsLowerCaseExtension on String {
  /// Returns `true` if the whole string is lower case.
  ///
  /// ```dart
  /// 'hi'.isLowerCase // true
  /// 'Hi'.isLowerCase // false
  /// '!'.isLowerCase // false
  /// 'hey, you!'.isLowerCase // true
  /// ```
  bool get isLowerCase => this == toLowerCase() && this != toUpperCase();
}

extension StringIsCapitalizedExtension on String {
  /// Returns `true` if the first character is upper case.
  bool get isCapitalized => isNotEmpty && this[0].isUpperCase;
}

extension StringIsDecapitalizedExtension on String {
  /// Returns `true` if the first character is lower case.
  bool get isDecapitalized => isNotEmpty && this[0].isLowerCase;
}

extension StringIsAsciiExtension on String {
  /// Returns `true` if the string is ASCII encoded.
  bool get isAscii {
    for (final codeUnit in codeUnits) {
      if (codeUnit > _ascii) return false;
    }
    return true;
  }
}

extension StringIsLatin1Extension on String {
  /// Returns `true` if the string is Latin 1 encoded.
  bool get isLatin1 {
    for (final codeUnit in codeUnits) {
      if (codeUnit > _latin1) return false;
    }
    return true;
  }
}

extension StringIsIntExtension on String {
  /// Returns `true` if the string can be parsed as an integer.
  bool get isInt => toIntOrNull() != null;
}

extension StringToIntExtension on String {
  /// Parses the string as an [int] number and returns the result.
  ///
  /// The [radix] must be in the range 2..36. The digits used are
  /// first the decimal digits 0..9, and then the letters 'a'..'z' with
  /// values 10 through 35. Also accepts upper-case letters with the same
  /// values as the lower-case ones.
  ///
  /// If no [radix] is given then it defaults to 10.
  int toInt({int? radix}) => int.parse(this, radix: radix);
}

extension StringToIntOrNullExtension on String {
  /// Parses the string as an [int] number and returns the result or `null` if
  /// the string is not a valid representation of a number.
  ///
  /// The [radix] must be in the range 2..36. The digits used are
  /// first the decimal digits 0..9, and then the letters 'a'..'z' with
  /// values 10 through 35. Also accepts upper-case letters with the same
  /// values as the lower-case ones.
  ///
  /// If no [radix] is given then it defaults to 10.
  int? toIntOrNull({int? radix}) => int.tryParse(this, radix: radix);
}

extension StringIsDoubleExtension on String {
  /// Returns `true` if the string can be parsed as a `double`.
  bool get isDouble => toDoubleOrNull() != null;
}

extension StringToDoubleExtension on String {
  /// Parses the string as a [double] number and returns the result.
  double toDouble() => double.parse(this);
}

extension StringToDoubleOrNullExtension on String {
  /// Parses the string as a [double] number and returns the result or `null`
  /// if the String is not a valid representation of a number.
  double? toDoubleOrNull() => double.tryParse(this);
}

extension StringToUtf16Extension on String {
  /// Encodes String as UTF-16.
  List<int> toUtf16() => codeUnits;
}

extension StringRemovePrefixExtension on String {
  /// If this [String] starts with the given [prefix], returns a copy of this
  /// string with the prefix removed. Otherwise, returns this [String].
  String removePrefix(String prefix) {
    if (startsWith(prefix)) {
      return substring(prefix.length, length);
    } else {
      return this;
    }
  }
}

extension StringRemoveSuffixExtension on String {
  /// If this [String] ends with the given [suffix], returns a copy of this
  /// [String] with the suffix removed. Otherwise, returns this [String].
  String removeSuffix(String suffix) {
    if (endsWith(suffix)) {
      return substring(0, length - suffix.length);
    } else {
      return this;
    }
  }
}

extension StringRemoveSurroundingExtension on String {
  /// Removes from a [String] both the given [prefix] and [suffix] if and only
  /// if it starts with the [prefix] and ends with the [suffix].
  /// Otherwise returns this [String] unchanged.
  String removeSurrounding({required String prefix, required String suffix}) {
    if (startsWith(prefix) && endsWith(suffix)) {
      return substring(prefix.length, length - suffix.length);
    } else {
      return this;
    }
  }
}

extension StringSliceExtension on String {
  /// Returns a new substring containing all characters between [start]
  /// (inclusive) and [end] (inclusive).
  /// If [end] is omitted, it is being set to `lastIndex`.
  ///
  ///  ```dart
  /// print('awesomeString'.slice(0,6)); // awesome
  /// print('awesomeString'.slice(7)); // String
  /// ```
  String slice(int start, [int end = -1]) {
    final start0 = start < 0 ? start + length : start;
    final end0 = end < 0 ? end + length : end;

    RangeError.checkValidRange(start0, end0, length);

    return substring(start0, end0 + 1);
  }
}

extension NullableStringOrEmptyExtension on String? {
  /// Returns the string if it is not `null`, or the empty string otherwise.
  String orEmpty() => this ?? '';
}

extension StringMatchesExtension on String {
  /// Returns `true` if this char sequence matches the given regular expression.
  bool matches(RegExp regex) => regex.hasMatch(this);
}

extension StringUrlCodingExtension on String {
  /// Translates a string into application/x-www-form-urlencoded format using a specific encoding scheme.
  String get urlEncode => Uri.encodeFull(this);

  /// Decodes an application/x-www-form-urlencoded string using a specific encoding scheme.
  String get urlDecode => Uri.decodeFull(this);
}

extension StringBufferWriteSpaceExtension on StringBuffer {
  /// Add a space to the buffer.
  void writeSpace() => write(' ');
}

/// Builds new string by populating newly created [StringBuffer] using provided [builderAction]
/// and then converting it to [String].
String buildString(void Function(StringBuffer sb) builderAction) {
  final buffer = StringBuffer();
  builderAction(buffer);
  return buffer.toString();
}
