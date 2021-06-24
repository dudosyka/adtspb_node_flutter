import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  Color _color;

  Loader(this._color) : super();

  @override
  Widget build(BuildContext context) {
    return SpinKitRotatingCircle(
      color: this._color,
      size: 50.0,
    );
  }
}
