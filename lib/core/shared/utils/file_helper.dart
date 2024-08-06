// ignore_for_file: prefer_constructors_over_static_methods

import 'dart:io';

FileSizeHelper getFileSize(File file) {
  final bytes = file.lengthSync();
  return FileSizeHelper.fromBytes(bytes.toDouble());
}

class FileSizeHelper {
  FileSizeHelper(this._bytes) {
    _bits = (_bytes * 8.0).ceil();
  }

  FileSizeHelper.withBits(this._bits) {
    _bytes = _bits / 8;
  }

  static FileSizeHelper fromBits(int value) => FileSizeHelper.withBits(value);

  int _bits = 0;
  double _bytes = 0.0;

  double get gigaBytes => _bytes / 1000000000;
  double get kiloBytes => _bytes / 1000;
  double get megaBytes => _bytes / 1000000;
  double get petaBytes => _bytes / 1E+15;
  double get teraBytes => _bytes / 1000000000000;

  static FileSizeHelper fromBytes(double value) => FileSizeHelper(value);
  static FileSizeHelper fromKibiBytes(double value) => FileSizeHelper(value * 1024.0);
  static FileSizeHelper fromMebiBytes(double value) => FileSizeHelper(value * 1048576.0);
  static FileSizeHelper fromGibiBytes(double value) => FileSizeHelper(value * 1073741824.0);
  static FileSizeHelper fromTebiBytes(double value) => FileSizeHelper(value * 1099511627776.0);
  static FileSizeHelper fromPebiBytes(double value) => FileSizeHelper(value * 1125899906842624.0);
  static FileSizeHelper fromKiloBytes(double value) => FileSizeHelper(value * 1000.0);
  static FileSizeHelper fromMegaBytes(double value) => FileSizeHelper(value * 1000000.0);
  static FileSizeHelper fromGigaBytes(double value) => FileSizeHelper(value * 1000000000.0);
  static FileSizeHelper fromTeraBytes(double value) => FileSizeHelper(value * 1000000000000.0);
  static FileSizeHelper fromPetaBytes(double value) => FileSizeHelper(value * 1E+15);

  FileSizeHelper add(FileSizeHelper value) => this + value;
  FileSizeHelper subtract(FileSizeHelper value) => this - value;
  FileSizeHelper addBytes(double value) => this + fromBytes(value);
  FileSizeHelper addKiloBytes(double value) => this + fromKiloBytes(value);
  FileSizeHelper addMegaBytes(double value) => this + fromMegaBytes(value);
  FileSizeHelper addGigaBytes(double value) => this + fromGigaBytes(value);
  FileSizeHelper addTeraBytes(double value) => this + fromTeraBytes(value);
  FileSizeHelper addPetaBytes(double value) => this + fromPetaBytes(value);
  FileSizeHelper addKibiBytes(double value) => this + fromKibiBytes(value);
  FileSizeHelper addMebiBytes(double value) => this + fromMebiBytes(value);
  FileSizeHelper addGibiBytes(double value) => this + fromGibiBytes(value);
  FileSizeHelper addTebiBytes(double value) => this + fromTebiBytes(value);
  FileSizeHelper addPebiBytes(double value) => this + fromPebiBytes(value);
  FileSizeHelper operator +(FileSizeHelper instance) => FileSizeHelper(instance._bytes + _bytes);
  FileSizeHelper operator -(FileSizeHelper instance) => FileSizeHelper(_bytes - instance._bytes);

  bool operator >(FileSizeHelper instance) => _bits > instance._bits;
  bool operator <(FileSizeHelper instance) => _bits < instance._bits;
  bool operator <=(FileSizeHelper instance) => _bits <= instance._bits;
  bool operator >=(FileSizeHelper instance) => _bits >= instance._bits;

  static int compare(FileSizeHelper a, FileSizeHelper b) => a._bits.compareTo(b._bits);
  static bool isEqual(FileSizeHelper a, FileSizeHelper b) => a.isEqualTo(b);
  int compareTo(FileSizeHelper instance) => compare(this, instance);
  bool isEqualTo(FileSizeHelper instance) => _bits == instance._bits;
}
