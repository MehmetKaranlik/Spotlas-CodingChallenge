import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  get _size => MediaQuery.of(this).size;
  double padding(ContextSpacing spacing) => spacing.returnValue(_size).toDouble();
}

enum ContextSpacing {
  xxxxsmall,
  xxxsmall,
  xxsmall,
  xsmall,
  small,
  medium,
  large,
  xlarge,
  xxlarge,
  xxxlarge,
  xxxxlarge,
}

extension ContextExtensionsExtension on ContextSpacing {
  int returnValue(Size size) {
    switch (this) {
      case ContextSpacing.xxxxsmall:
        return _sizePopulator(size, 1, 1, 1);
      case ContextSpacing.xxxsmall:
        return _sizePopulator(size, 1, 2, 3);
      case ContextSpacing.xxsmall:
        return _sizePopulator(size, 2, 4, 6);
      case ContextSpacing.xsmall:
        return _sizePopulator(size, 4, 8, 12);
      case ContextSpacing.small:
        return _sizePopulator(size, 8, 12, 16);
      case ContextSpacing.medium:
        return _sizePopulator(size, 12, 16, 24);
      case ContextSpacing.large:
        return _sizePopulator(size, 16, 24, 32);
      case ContextSpacing.xlarge:
        return _sizePopulator(size, 24, 32, 40);
      case ContextSpacing.xxlarge:
        return _sizePopulator(size, 32, 48, 56);
      case ContextSpacing.xxxlarge:
        return _sizePopulator(size, 48, 64, 80);
      case ContextSpacing.xxxxlarge:
        return _sizePopulator(size, 96, 128, 160);

      default:
        return 5;
    }
  }

  int _sizePopulator(Size size, int s, int m, int l) {
    if (size.width <= 320) {
      return s;
    } else if (size.width > 320 && size.width <= 370) {
      return m;
    } else if (size.width > 370) {
      return l;
    }
    return s;
  }
}
