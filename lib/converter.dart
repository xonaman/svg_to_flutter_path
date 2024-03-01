import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/foundation.dart';

abstract class Converter {
  static Future<String> convert({
    required String svgPath,
    required double svgWidth,
    required double svgHeight,
  }) async {
    return await compute(_convert, <dynamic>[svgPath, svgWidth, svgHeight]);
  }

  static String _convert(List<dynamic> args) {
    final String svgPath = args[0];
    final double svgWidth = args[1];
    final double svgHeight = args[2];

    final StringBuffer resultBuffer = StringBuffer(
      'final Path path = Path();\n',
    );

    String lastLetter = '';
    int index = 0;
    double previousX = 0;
    double previousY = 0;
    double previousControlEndX = 0;
    double previousControlEndY = 0;

    List<double> takeNumbers(int amount) {
      final List<double> result = <double>[];
      while (result.length < amount && index < svgPath.length) {
        final RegExpMatch? match = RegExp(
          r'^-?[0-9]+(?:\.[0-9]+)?',
        ).firstMatch(svgPath.substring(index));
        if (match?[0] != null) {
          result.add(double.parse(match![0]!));
          index += match[0]!.length;
        } else {
          index++;
        }
      }
      return result;
    }

    while (index < svgPath.length) {
      final RegExpMatch? match = RegExp(
        r'^\s*([A-z])',
      ).firstMatch(svgPath.substring(index));
      final String letter = match?[1] != null ? match![1]! : lastLetter;

      switch (letter.toLowerCase()) {
        case 'a':
          final List<double> numbers = takeNumbers(7);
          if (StringUtils.isLowerCase(letter)) {
            numbers[5] += previousX;
            numbers[6] += previousY;
          }
          resultBuffer.write(
            'path.arcToPoint(\n'
            '  Offset(\n'
            '    ${numbers[5] / svgWidth} * size.width,\n'
            '    ${numbers[6] / svgHeight} * size.height,\n'
            '  ),\n'
            '  radius: Radius.elliptical(\n'
            '    ${numbers[0] / svgWidth} * size.width,\n'
            '    ${numbers[1] / svgHeight} * size.height,\n'
            '  ),\n'
            '  rotation: ${numbers[2]},\n'
            '  largeArc: ${numbers[3] == 1},\n'
            '  clockwise: ${numbers[4] == 1},\n'
            ');\n',
          );
          previousX = numbers[5];
          previousY = numbers[6];
          break;
        case 'm':
          final List<double> numbers = takeNumbers(2);
          if (StringUtils.isLowerCase(letter)) {
            numbers[0] += previousX;
            numbers[1] += previousY;
          }
          resultBuffer.write(
            'path.moveTo(\n'
            '  ${(numbers[0] / svgWidth)} * size.width,\n'
            '  ${(numbers[1] / svgHeight)} * size.height,\n'
            ');\n',
          );
          previousX = numbers[0];
          previousY = numbers[1];
          break;
        case 'l':
          final List<double> numbers = takeNumbers(2);
          if (StringUtils.isLowerCase(letter)) {
            numbers[0] += previousX;
            numbers[1] += previousY;
          }
          resultBuffer.write(
            'path.lineTo(\n'
            '  ${(numbers[0] / svgWidth)} * size.width,\n'
            '  ${(numbers[1] / svgHeight)} * size.height,\n'
            ');\n',
          );
          previousX = numbers[0];
          previousY = numbers[1];
          break;
        case 'h':
          final List<double> numbers = takeNumbers(1);
          if (StringUtils.isLowerCase(letter)) {
            numbers[0] += previousX;
          }
          resultBuffer.write(
            'path.lineTo(\n'
            '  ${(numbers[0] / svgWidth)} * size.width,\n'
            '  ${(previousY / svgHeight)} * size.height,\n'
            ');\n',
          );
          previousX = numbers[0];
          break;
        case 'v':
          final List<double> numbers = takeNumbers(1);
          if (StringUtils.isLowerCase(letter)) {
            numbers[0] += previousY;
          }
          resultBuffer.write(
            'path.lineTo(\n'
            '  ${(previousX / svgWidth)} * size.width,\n'
            '  ${(numbers[0] / svgHeight)} * size.height,\n'
            ');\n',
          );
          previousY = numbers[0];
          break;
        case 'q':
          final List<double> numbers = takeNumbers(4);
          if (StringUtils.isLowerCase(letter)) {
            numbers[0] += previousX;
            numbers[1] += previousY;
            numbers[2] += previousX;
            numbers[3] += previousY;
          }
          resultBuffer.write(
            'path.quadraticBezierTo(\n'
            '  ${(numbers[0] / svgWidth)} * size.width,\n'
            '  ${(numbers[1] / svgHeight)} * size.height,\n'
            '  ${(numbers[2] / svgWidth)} * size.width,\n'
            '  ${(numbers[3] / svgHeight)} * size.height,\n'
            ');\n',
          );
          previousX = numbers[0];
          previousY = numbers[1];
          previousControlEndX = numbers[2];
          previousControlEndY = numbers[3];
          break;
        case 'c':
          final List<double> numbers = takeNumbers(6);
          if (StringUtils.isLowerCase(letter)) {
            numbers[0] += previousX;
            numbers[1] += previousY;
            numbers[2] += previousX;
            numbers[3] += previousY;
            numbers[4] += previousX;
            numbers[5] += previousY;
          }
          resultBuffer.write(
            'path.cubicTo(\n'
            '  ${(numbers[0] / svgWidth)} * size.width,\n'
            '  ${(numbers[1] / svgHeight)} * size.height,\n'
            '  ${(numbers[2] / svgWidth)} * size.width,\n'
            '  ${(numbers[3] / svgHeight)} * size.height,\n'
            '  ${(numbers[4] / svgWidth)} * size.width,\n'
            '  ${(numbers[5] / svgHeight)} * size.height,\n'
            ');\n',
          );
          previousX = numbers[4];
          previousY = numbers[5];
          previousControlEndX = numbers[2];
          previousControlEndY = numbers[3];
          break;
        case 's':
          final List<double> numbers = takeNumbers(4);
          if (StringUtils.isLowerCase(letter)) {
            numbers[0] += previousX;
            numbers[1] += previousY;
            numbers[2] += previousX;
            numbers[3] += previousY;
          }
          final double controlStartX = 2 * previousX - previousControlEndX;
          final double controlStartY = 2 * previousY - previousControlEndY;
          resultBuffer.write(
            'path.cubicTo(\n'
            '  ${(controlStartX / svgWidth)} * size.width,\n'
            '  ${(controlStartY / svgHeight)} * size.height,\n'
            '  ${(numbers[0] / svgWidth)} * size.width,\n'
            '  ${(numbers[1] / svgHeight)} * size.height,\n'
            '  ${(numbers[2] / svgWidth)} * size.width,\n'
            '  ${(numbers[3] / svgHeight)} * size.height,\n'
            ');\n',
          );
          previousX = numbers[2];
          previousY = numbers[3];
          previousControlEndX = numbers[0];
          previousControlEndY = numbers[1];
          break;
        case 'z':
          resultBuffer.write('path.close();\n');
          index++;
          break;
        default:
          index++;
          break;
      }
      lastLetter = letter;
    }
    return resultBuffer.toString();
  }
}
