import 'package:flutter/material.dart';
import 'widget/color_filter_widget.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorFilterScreen(),
    );
  }
}

class ColorFilterScreen extends StatelessWidget {

  List _colors = [Colors.red, Colors.green, Colors.yellow, Colors.purple, Colors.orange];
  Random _random = Random();
  List _blendModes = [BlendMode.src, BlendMode.colorBurn, BlendMode.color, BlendMode.clear,
    BlendMode.colorDodge, BlendMode.darken, BlendMode.difference, BlendMode.difference,
    BlendMode.dstATop, BlendMode.dst, BlendMode.dstIn, BlendMode.dstOut, BlendMode.dstOver,
    BlendMode.exclusion, BlendMode.hardLight, BlendMode.hue, BlendMode.lighten, BlendMode.luminosity,
  BlendMode.modulate, BlendMode.multiply, BlendMode.overlay, BlendMode.plus, BlendMode.saturation,
  BlendMode.screen, BlendMode.softLight, BlendMode.srcATop, BlendMode.srcIn, BlendMode.srcOut, BlendMode.srcOver,
  BlendMode.xor];

  _buildListView() {
    Color color = _colors[_random.nextInt(_colors.length)];

    return List.generate(_blendModes.length, (index) {
      return ColorFilterWidget(
          color: color,
          blendMode: _blendModes[index],
          child: Container(
            margin: EdgeInsets.all(8.0),
            height: 50.0,
            width: 300.0,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  child: Text("Test"),
                ),
                Container(
                  color: Colors.red,
                  child: Text("Second test"),
                )
              ],
            ),
          ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color filter test"),
      ),
      body: Container(
        child: ListView(
          children: _buildListView(),
        ),
      ),
    );
  }
}
