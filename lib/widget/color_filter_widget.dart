import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';

class ColorFilterWidget extends SingleChildRenderObjectWidget {
  const ColorFilterWidget({
    Key key,
    @required this.color,
    @required this.blendMode,
    Widget child
  }) : assert(color != null),
        assert(blendMode != null),
        super(key: key, child: child);

  final Color color;
  final BlendMode blendMode;

  @override
  RenderColorFilter createRenderObject(BuildContext context) {
    return new RenderColorFilter(color: color, blendMode: blendMode);
  }

  @override
  void updateRenderObject(BuildContext context, RenderColorFilter renderObject) {
    renderObject.color = color;
    renderObject.blendMode = blendMode;
  }
}

class RenderColorFilter extends RenderProxyBox {

  RenderColorFilter({ RenderBox child, @required Color color, @required BlendMode blendMode })
      : assert(color != null),
        assert(blendMode != null),
        _color = color,
        _blendMode = blendMode,
        super(child);

  Color get color => _color;
  Color _color;

  BlendMode get blendMode => _blendMode;
  BlendMode _blendMode;

  set color(Color value) {
    assert(value != null);
    if (_color == value)
      return;
    _color = value;
    markNeedsPaint();
  }

  set blendMode(BlendMode value) {
    assert(value != null);
    if (_blendMode == value)
      return;
    _blendMode = value;
    markNeedsPaint();
  }

  @override
  bool get alwaysNeedsCompositing => child != null;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      assert(needsCompositing);
      context.pushLayer(new ColorFilterLayer(color: _color, blendMode: _blendMode), super.paint,
        offset,);
    }
  }
}

class ColorFilterLayer extends ContainerLayer {
  ColorFilterLayer({ this.color, this.blendMode });

  Color color;
  BlendMode blendMode;

  @override
  ui.EngineLayer addToScene(ui.SceneBuilder builder, [Offset layerOffset = Offset.zero]) {
    final ColorFilter filter = ColorFilter.mode(color, blendMode);
    builder.pushColorFilter(filter);
    addChildrenToScene(builder, layerOffset);
    builder.pop();
    return null; // this does not return an engine layer yet.
  }
}
