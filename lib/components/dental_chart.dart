import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_drawing/path_drawing.dart';

import '../modules/dental_chart/adult_teeth_controller.dart';
import '../modules/dental_chart/tooth_model.dart';

class AdultDentalChart extends StatelessWidget {
  final notifier = ValueNotifier(Offset.zero);
  List<Tooth> teeth=[];
  AdultDentalChart(this.teeth);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (e) => notifier.value = e.localPosition,
      onPointerMove: (e) => notifier.value = e.localPosition,
      child: CustomPaint(
        painter: AdultTeeth(notifier,teeth),
        child: SizedBox.expand(),
      ),
    );
  }
}

class Shape {
  Shape(strPath, this._label, this._color) : _path = parseSvgPathData(strPath);

  /// transforms a [_path] into [_transformedPath] using given [matrix]
  void transform(Matrix4 matrix) =>
      _transformedPath = _path!.transform(matrix.storage);

  final Path? _path;
  Path? _transformedPath;
  final String? _label;
  final Color? _color;
}

class AdultTeeth extends CustomPainter {
  List<Tooth> teeth=[];
  AdultTeeth(this._notifier,this.teeth) : super(repaint: _notifier);
  AdultTeethController _controller=Get.put(AdultTeethController());

  static final _data =
  '''m 66.7,369.7 -7.7,0.6 -8,3.4 -7.3,10.6 -1.4,7.7 -3.6,14 2.3,9.3 3.3,5 3,3.7 4.4,0.3 6,-0.3 4.6,-1.3 h 4.4 l 4.3,1.6 5.3,-1.6 4.4,-3.4 4,-7 0.6,-7.3 2,-13.3 -2.3,-11.7 -4.3,-5 -7,-3.7 z
m 76,425.7 4.3,2 3,5.3 2,14.7 -1,11 -4.6,13.6 -6.7,2.7 -22.7,4.7 -3.6,-3 -9,-30.4 2,-8 3.6,-6.3 5.7,-5.3 7,-2 h 9 z
m 78.7,476 6.3,5 5.3,7.3 6,11 1.4,12 -4.7,10.7 -7,4.3 -19,6.7 -6.7,-3.3 -4,-6 -4.6,-12.7 -4,-16.3 v -6.4 l 2.6,-5 4.7,-3.6 12,-3 z
m 93.3,525 6,2.3 9,8.7 5.7,10.7 1.7,12.6 -1.4,8 -8,5.7 -8,5.3 -10.3,0.7 -6,-4 -7,-10 -5.7,-12.7 -2,-10.3 2.4,-6 4.6,-4.3 10,-3.4 z
m 117.3,569.7 7.7,1.3 6.3,3.7 6.3,7.7 4,8.3 2.4,11.3 -1.3,6.7 -6.7,6.7 -7.7,3.3 -7.3,-1 -7,-3 -7.3,-7 -5,-9 -2,-10 c 0,0 -0.7,-7 0.3,-7.3 1,-0.3 5.3,-6.7 5.3,-6.7 l 9,-5 z
m 155.7,611 4.6,4.3 4.7,9.4 -3.3,9.6 -5.7,7 -7,2.7 -8.3,0.3 -7.4,-3 -4.6,-6.6 V 629 l 4,-7.7 5,-6.3 6,-4 6,-1 z
m 178.3,627 7.7,2 1.7,4.7 1,10.3 0.3,13 0.3,5.7 -3,1 -9.6,-0.7 -8.7,-6.7 -8.7,-6.6 -2.6,-5.7 5.3,-4.7 z
m 214,637 4,5.7 5,11.6 2.7,9.7 -0.4,2.3 -6.3,2 -12.3,-0.3 -10.7,-2.3 -5.7,-3 2.7,-5.4 6.7,-10 7.3,-9.3 3.7,-2.5 z
m 235.3,637 a 29,29 0 0 1 4,-2.3 19.98,19.98 0 0 1 4.3,0 l 5,4.3 5.3,7.3 3.3,6.7 2,7.3 -2,3 -7.7,2.7 -10,0.3 h -10 l -2,-6.7 2.7,-7.3 z
m 269.3,624 4,0.7 2,2.6 3.7,1.4 2.7,2.6 3.6,3.4 4,3.6 2.7,5 -0.7,6.7 -4.3,5 -6.3,3.7 -8.7,1.3 -7,0.7 -3.7,-3.4 0.4,-7.3 2,-13 0.6,-10 z
m 286,629.3 0.7,4 4.6,5.4 4,3.6 6.7,1.7 9.7,-0.7 6.6,-5.6 2.7,-7.7 0.3,-9.7 -4.3,-6 -9,-6.3 -9.7,-1 -7.3,2.3 -4,3 -0.3,5.4 0.6,7 z
m 331,565.7 h 4 l 6.3,2.3 8,6.3 3,4 0.4,5.4 -2,10 -8,10.3 -5,5 -9.7,3.7 -8,0.6 -5,-2.3 -6.7,-6.3 -1.6,-6.7 0.6,-6.7 1.7,-6.6 3.7,-6.4 5.6,-6.6 z
m 334,561 4.7,5 7.3,4 8.7,3 6,-1.3 7.3,-3.4 15,-23.3 2.3,-12.3 -4,-8.4 -7.3,-3.6 -10.3,-4.4 -7.4,-1 -5,3 -5,5.7 -6,10.3 -4.3,12.4 z
m 398,470 4.7,5.7 3,7.7 -0.3,11.7 -6,13.3 -6.3,10.3 -8.3,4.3 -7.3,-1 -16.3,-7 c 0,0 -2.7,-6 -3,-7.3 -0.3,-1.3 -0.3,-11 -0.3,-11 l 3.7,-14.3 3.7,-7 5.3,-6.7 8,-2 9.7,-0.7 z
m 410,435 -1.3,12.3 -4.4,11.7 -5,8.7 -5.6,0.3 -5.7,-2 -11.7,0.3 h -6.6 l -4,-6.3 -1,-15.3 1.6,-10.4 2.7,-10.3 9.3,-6.7 8.4,-1.6 5,-0.4 4.3,2.7 h 3.7 l 4.3,3.7 3.7,5.6 z
m 371.7,417 6.6,0.3 8.4,-1.6 5,-0.4 5.6,2.4 5.4,-1.4 5,-6.6 -1,-14.7 -5.7,-17.3 -3.7,-4.7 -6.6,-5.7 -10.7,-2.3 -7,1.7 -5.7,2.3 -3.3,5.3 -4,14.7 3.3,12.3 4.4,11 z
m 404.3,293.7 4.4,5.6 v 8.7 l -3.4,10.7 -4.3,11 -8.7,10 -9.6,1.3 -13.7,-1.3 -10,-4.7 -4.3,-7.3 -0.4,-11.7 4,-12 5.4,-10 5,0.7 10,1.3 H 389 Z
m 362.3,247.3 -5,3.7 -0.3,8.3 1.7,8.7 1,11.7 1.6,7 3.7,5 6,2.6 21,0.7 12.3,-1.3 5.7,-13 2,-17.4 -4.7,-16.6 -6.3,-6.4 -5,-0.6 -6.7,3.3 z
m 359.7,243.7 -9,-19.7 -5,-12.3 3,-6.7 9.6,-2.3 17.4,-5.7 13,-4 4.3,3 6.3,11 2,15.7 -1.3,11.6 -5.3,6.4 -13,4 -10.7,1.3 z
m 386,188.7 -2.7,4 -5.6,3.3 -21.4,7.3 -10.6,-1 -4,-2.6 -3,-3.4 -3.7,-7.6 -3,-11.7 1.7,-7.3 4.3,-5 8.3,-3.7 7.4,-4.3 6.6,-6.4 3.7,0.7 6.7,5.3 5.6,8 3.7,6 3.3,8 z
m 358.7,134.3 1.6,11.4 -3,7 -5.3,4.6 -5.7,3.7 -10.3,3 -6.3,-0.7 -8,-5.6 -7.4,-8.7 -3.6,-9.7 -0.7,-5.6 2.3,-6.7 6,-1.3 7.7,-3.7 6.7,-6 2,-1.7 3,3 5.6,2.4 5.4,3 5.6,5 z
m 336,93.3 1.7,6.7 -1.7,4.7 -3.3,9 -8.4,7.6 -9,4.4 -9,0.3 -9,-5.7 -3.3,-8.3 1.7,-9.3 3.3,-7.7 4.3,-5 6,-2 7,-0.7 h 6.4 l 5.3,1 z
m 310.3,83.3 -12.3,7.4 -12,4.3 -9.7,3.3 -6,-5 L 269,82.7 V 69.3 l 1,-10.6 4.7,-4 7.3,-1.7 5.7,1.7 9.6,5.6 6.7,4 4.7,4.4 3.6,5.3 0.7,7 z
m 273.3,52 -6.6,9.7 -8.4,10.6 -5,7.4 -6,5.3 -8.3,2.7 -6.7,-5.7 -7.6,-15 -2.7,-8.7 -3,-8.3 1,-5.7 4.3,-4 5.7,-1.6 h 7.3 l 15.7,0.6 5.7,2 5.6,2.4 4,2 z
M 176.7,46.3 195,41 l 8.3,-1.3 6,1 6,2 1.7,4.3 0.7,7.3 -2.7,10.4 -2.7,11 -4.3,7.3 -6.3,2.7 -6,1 -6,-3.4 -6,-8.6 -8.7,-12.7 -3.3,-8 1,-4.3 z
m 167,55 6.7,6.3 0.3,6.7 0.3,8 1,10 -2,8.3 -4.7,4.3 -6.7,1.7 -8,-4.3 -7.3,-4.7 -9.3,-4.7 -6.3,-5.3 -1,-4.3 1.3,-5 c 0,0 3.3,-6 4.3,-6 1,0 5.3,-6 6.3,-6 1,0 10.3,-4.7 10.3,-4.7 z
m 126.3,82 8,4.3 5.4,6 5,12.4 1,10.6 -2,5.4 -5.7,3.6 -6.7,0.7 H 121 l -6.3,-5.7 -4.4,-7 -2,-7.6 0.4,-10 2,-6 5.3,-4.7 z
m 109,116.7 7,5.6 6.7,3 5,6 0.6,9.7 -5.6,12.7 -8.7,8 -8.3,0.6 -9,-1.3 -11,-5 -3.7,-6 -1,-10.7 5.3,-11.3 6.7,-6.7 7.7,-4 z
m 82,155.3 20.3,8 6.4,8.7 0.6,10 -4.6,10 -4.7,7 -6,4.7 -8.7,-2 -11.6,-0.7 -9.4,-4.3 -4,-6 -1.3,-7.4 2.7,-8 4.6,-7.6 5,-6.4 z
m 92.7,207.3 2,5.3 -1.7,8 -1.7,9 -4,8 -5,7.7 -11,4.7 -13.7,0.7 -10,-7 -1.7,-5 -0.9,-18.7 3,-10.7 5,-7.3 4,-3.3 4.7,-2.7 5.3,3.7 6.7,1.3 c 0,0 7.3,1.3 9.3,1.3 a 57.333,57.333 0 0 1 6.3,0.7 z
M 79.7,288.3 71.7,291 55,293 40.3,291.3 36,287 33,273.7 36.3,260 42,248.7 l 2.7,-4 5.6,2 5.7,2.3 9.3,1.7 8.7,-1 h 6.3 l 2,4.3 3,5.3 1.7,8.4 0.7,7 -2.4,8 z
m 33,314.3 5,11.4 7.7,10 10,6 9,1.3 8.6,-3 4.4,-4.3 3.6,-9.4 0.7,-12 -0.7,-12.3 -0.6,-9.3 -7,-0.7 -22.4,1.7 H 38.7 L 34,298 31.7,302.3 32,311 Z



'''
      .split('\n');


  final _shapes = [
    Shape(_data[0], 'Tooth 32', Colors.white),
    Shape(_data[1], 'Tooth 31', Colors.white),
    Shape(_data[2], 'Tooth 30', Colors.white),
    Shape(_data[3], 'Tooth 29', Colors.white!),
    Shape(_data[4], 'Tooth 28', Colors.white),
    Shape(_data[5], 'Tooth 27', Colors.white),
    Shape(_data[6], 'Tooth 26', Colors.white),
    Shape(_data[7], 'Tooth 25', Colors.white),
    Shape(_data[8], 'Tooth 24', Colors.white),
    Shape(_data[9], 'Tooth 23', Colors.white),
    Shape(_data[10], 'Tooth 22', Colors.white),
    Shape(_data[11], 'Tooth 21', Colors.white),
    Shape(_data[12], 'Tooth 20', Colors.white),
    Shape(_data[13], 'Tooth 19', Colors.white),
    Shape(_data[14], 'Tooth 18', Colors.white),
    Shape(_data[15], 'Tooth 17', Colors.white),
    Shape(_data[16], 'Tooth 16', Colors.white),
    Shape(_data[17], 'Tooth 15', Colors.white),
    Shape(_data[18], 'Tooth 14', Colors.white),
    Shape(_data[19], 'Tooth 13', Colors.white),
    Shape(_data[20], 'Tooth 12', Colors.white),
    Shape(_data[21], 'Tooth 11', Colors.white),
    Shape(_data[22], 'Tooth 10', Colors.white),
    Shape(_data[23], 'Tooth 9', Colors.white),
    Shape(_data[24], 'Tooth 8', Colors.white),
    Shape(_data[25], 'Tooth 7', Colors.white),
    Shape(_data[26], 'Tooth 6', Colors.white),
    Shape(_data[27], 'Tooth 5', Colors.white),
    Shape(_data[28], 'Tooth 4', Colors.white),
    Shape(_data[29], 'Tooth 3', Colors.white),
    Shape(_data[30], 'Tooth 2', Colors.white),
    Shape(_data[31], 'Tooth 1', Colors.white),
  ];

  Color getColor(String status) {
    switch(status){
      case "Normal":{
        return Colors.white;
      }
      case "Rotten":{
        return Colors.black;
      }
      case "Extracted":{
        return Colors.red;
      }
      case "Broken":{
        return Colors.yellow;
      }

    }
    return Colors.white;
  }

  final ValueNotifier<Offset> _notifier;
  final Paint _paint = Paint();
  Size _size = Size.zero;

  @override
  void paint(Canvas canvas, Size size) {

    if (size != _size) {
      _size = size;
      final fs = applyBoxFit(BoxFit.contain, Size(450.22101, 600.22101), size);
      final r = Alignment.center.inscribe(fs.destination, Offset.zero & size);
      final matrix = Matrix4.translationValues(r.left, r.top, 0)
        ..scale(fs.destination.width / fs.source.width);
      for (var shape in _shapes) {
        shape.transform(matrix);
      }
      print('new size: $_size');
    }

    canvas
      ..clipRect(Offset.zero & size)
      ..drawColor(Colors.blueGrey, BlendMode.src);
    var selectedShape;
    for (int i=0;i<_shapes.length;i++) {
      final path = _shapes[i]._transformedPath;
      final selected = path!.contains(_notifier.value);
      _paint
        ..color = selected ? Colors.teal : getColor(teeth[i].status!)
        ..style = PaintingStyle.fill;
      canvas.drawPath(path!, _paint);
      selectedShape ??= selected ? _shapes[i] : null;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        print("timer");
        if(selected) {
          _controller.onFABTapped(teeth[i]);
        }
      });
      _paint
        ..color = Colors.black
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke;
      canvas.drawPath(path!, _paint);
    }
    if (selectedShape != null) {
      _paint
        ..color = Colors.black
        ..maskFilter = MaskFilter.blur(BlurStyle.outer, 12)
        ..style = PaintingStyle.fill;
      canvas.drawPath(selectedShape._transformedPath, _paint);
      _paint.maskFilter = null;

      final builder = ui.ParagraphBuilder(ui.ParagraphStyle(
        fontSize: 14,
        fontFamily: 'Roboto',
      ))
        ..pushStyle(ui.TextStyle(
          color: Colors.white70,
          shadows: kElevationToShadow[1]! + kElevationToShadow[2]!,
        ))
        ..addText(selectedShape._label);
      final paragraph = builder.build()
        ..layout(ui.ParagraphConstraints(width: size.width));
      canvas.drawParagraph(paragraph, _notifier.value.translate(0, -8));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

/*
final _shapes = [
      Shape(_data[0], 'Tooth 32', getColor(teeth[0].status!)),
      Shape(_data[1], 'Tooth 31', getColor(teeth[1].status!)),
      Shape(_data[2], 'Tooth 30', getColor(teeth[2].status!)),
      Shape(_data[3], 'Tooth 29', getColor(teeth[3].status!)),
      Shape(_data[4], 'Tooth 28', getColor(teeth[4].status!)),
      Shape(_data[5], 'Tooth 27', getColor(teeth[5].status!)),
      Shape(_data[6], 'Tooth 26', getColor(teeth[6].status!)),
      Shape(_data[7], 'Tooth 25', getColor(teeth[7].status!)),
      Shape(_data[8], 'Tooth 24', getColor(teeth[8].status!)),
      Shape(_data[9], 'Tooth 23', getColor(teeth[9].status!)),
      Shape(_data[10], 'Tooth 22', getColor(teeth[10].status!)),
      Shape(_data[11], 'Tooth 21', getColor(teeth[11].status!)),
      Shape(_data[12], 'Tooth 20', getColor(teeth[12].status!)),
      Shape(_data[13], 'Tooth 19', getColor(teeth[13].status!)),
      Shape(_data[14], 'Tooth 18', getColor(teeth[14].status!)),
      Shape(_data[15], 'Tooth 17', getColor(teeth[15].status!)),
      Shape(_data[16], 'Tooth 16', getColor(teeth[16].status!)),
      Shape(_data[17], 'Tooth 15', getColor(teeth[17].status!)),
      Shape(_data[18], 'Tooth 14', getColor(teeth[18].status!)),
      Shape(_data[19], 'Tooth 13', getColor(teeth[19].status!)),
      Shape(_data[20], 'Tooth 12', getColor(teeth[20].status!)),
      Shape(_data[21], 'Tooth 11', getColor(teeth[21].status!)),
      Shape(_data[22], 'Tooth 10', getColor(teeth[22].status!)),
      Shape(_data[23], 'Tooth 9', getColor(teeth[23].status!)),
      Shape(_data[24], 'Tooth 8', getColor(teeth[24].status!)),
      Shape(_data[25], 'Tooth 7', getColor(teeth[25].status!)),
      Shape(_data[26], 'Tooth 6', getColor(teeth[26].status!)),
      Shape(_data[27], 'Tooth 5', getColor(teeth[27].status!)),
      Shape(_data[28], 'Tooth 4', getColor(teeth[28].status!)),
      Shape(_data[29], 'Tooth 3', getColor(teeth[29].status!)),
      Shape(_data[30], 'Tooth 2', getColor(teeth[30].status!)),
      Shape(_data[31], 'Tooth 1', getColor(teeth[31].status!)),
    ];
 */