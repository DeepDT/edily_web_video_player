import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

enum LoaderType { one, two, random, circular }

class _EdilyCircularLoader extends StatelessWidget {
  const _EdilyCircularLoader({
    Key? key,
    this.size = const Size(21, 21),
    this.color = Colors.white,
  }) : super(key: key);

  final Size? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size?.height,
      width: size?.width,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: color,
      ),
    );
  }
}

Widget _selectLoader(
  LoaderType type, {
  Size? size,
  Color? color,
}) {
  switch (type) {
    case LoaderType.one:
      return Lottie.asset(
        'lottie/loader_one.json',
      );
    case LoaderType.two:
      return Lottie.asset(
        'lottie/loader_two.json',
      );
    case LoaderType.random:
      var random = math.Random();
      if (random.nextInt(10) % 2 == 0) {
        return Lottie.asset(
          'lottie/loader_one.json',
        );
      } else {
        return Lottie.asset(
          'lottie/loader_two.json',
        );
      }
    case LoaderType.circular:
      return _EdilyCircularLoader(
        size: size,
        color: color,
      );
  }
}

class EdilyLoader extends StatelessWidget {
  const EdilyLoader({
    Key? key,
    this.size,
    this.color,
    this.type = LoaderType.random,
  }) : super(key: key);

  ///Size of the loader. Applicable for all types
  final Size? size;

  ///Only for circular loader type
  final Color? color;

  ///Type of the loader
  final LoaderType type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size?.width,
      height: size?.height,
      child: _selectLoader(
        type,
        size: size,
        color: color,
      ),
    );
  }
}
