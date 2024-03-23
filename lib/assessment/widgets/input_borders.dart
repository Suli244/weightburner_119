import 'package:flutter/material.dart';

class InputBorders {
  static OutlineInputBorder outlineBorderColorE5E5E5Width1Radius10 =
      const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  );

  static OutlineInputBorder outlineBorderColorGreenWidth2Radius10 =
      const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  );

  static const OutlineInputBorder outlineBordercolorF68080Width2Radius10 =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(
        10,
      ),
    ),
  );

  static const UnderlineInputBorder unOutlineBorderColorE5E5E5Width1 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.purple,
      width: 1,
    ),
  );
  static const UnderlineInputBorder unOutlineBorderColorGreenWidth2 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.green,
      width: 2,
    ),
  );
  static const UnderlineInputBorder unOutlineBordercolorF68080Width2 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.yellow,
      width: 2,
    ),
  );
}
