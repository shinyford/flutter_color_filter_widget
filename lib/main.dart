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

  _buildListView(BuildContext context) {
    Color color = _colors[_random.nextInt(_colors.length)];

    return List.generate(_blendModes.length, (index) {
      return ColorFilterWidget(
          color: color,
          blendMode: _blendModes[index],
          child: Container(
            color: Colors.red,
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            child: Center(
              child: Text("Lorem ipsum dolor sit amet", style:
                TextStyle(color: Colors.greenAccent),),
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
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: _buildListView(context),
        ),
      ),
    );
  }
}
