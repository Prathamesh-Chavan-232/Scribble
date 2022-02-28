import 'package:flutter/material.dart';
import 'drawn_line.dart';
import 'sketcher.dart';

class DrawPage extends StatefulWidget {
 const DrawPage({Key? key}) : super(key: key);
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  final GlobalKey _globalKey = GlobalKey();
  List<DrawnLine?>? lines = <DrawnLine>[];
  DrawnLine? line;

  _DrawPageState({
    this.lines, this.line
});
  Color selectedColor = Colors.black;
  double selectedWidth = 5.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text("hey"),
        /*Stack(
        children: [
        // basically we aint adding any body but we are using the gesture detector thingy rn okay xD
        //buildCurrentPath(context),

    ],
    ),*/
    );
  }

  Widget buildCurrentPath(BuildContext context) {
    return GestureDetector(  //to detect the screen touch
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: Container(
          color: Colors.blueAccent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CustomPaint(
            painter: Sketcher(lines: [line!]),
          ),
          // CustomPaint widget will go here
        ),
      ),
    );
  }
  void onPanStart(DragStartDetails details) {
    print('User started drawing');
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);
    print(point);
    setState((){
      line = DrawnLine([point], selectedColor, selectedWidth);
    });
  }

  void onPanUpdate(DragUpdateDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);
    print(point);
    List<Offset> path = List.from(line!.path)..add(point);
    setState((){
      line = DrawnLine(path, selectedColor, selectedWidth);
    });
  }

  void onPanEnd(DragEndDetails details) {
    setState((){
      print('User ended drawing');
    });
  }


}