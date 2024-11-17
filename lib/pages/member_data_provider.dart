import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MemberData with ChangeNotifier {
  String _name = "";
  String _dev = "";
  String _year = "";
  Uint8List? _image;

  String get name => _name;
  String get dev => _dev;
  String get year => _year;
  Uint8List? get image => _image;

  void updateMemberData(String name, String dev, String year, Uint8List? image) {
    _name = name;
    _dev = dev;
    _year = year;
    _image = image;
    notifyListeners();
  }
}
