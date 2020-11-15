import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BrandIcon extends StatelessWidget {
  /// The icon to display inside the button.
  final IconData icon;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback onPressed;

  /// The padding around the button's icon. The entire padded icon will react
  /// to input gestures.
  ///
  /// This property must not be null. It defaults to 8.0 padding on all sides.
  final EdgeInsetsGeometry padding;

  /// The size of the icon inside the button.
  ///
  /// This property must not be null. It defaults to 16.0.
  final double iconSize;

  /// Text that describes the action that will occur when the button is pressed.
  ///
  /// This text is displayed when the user long-presses on the button and is
  /// used for accessibility.
  final String tooltip;

  const BrandIcon(
    this.icon, {
    Key key,
    this.onPressed,
    this.iconSize = 16.0,
    this.padding = const EdgeInsets.all(8.0),
    this.tooltip,
  })  : assert(icon != null),
        assert(iconSize != null),
        assert(padding != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget result = Icon(
      icon,
      size: iconSize ?? 15.0,
    );

    if (tooltip != null) {
      result = Tooltip(
        message: tooltip,
        child: result,
      );
    }

    return Semantics(
      button: true,
      enabled: onPressed != null,
      child: InkResponse(
        radius: (iconSize / 2.0) + padding.horizontal / 2,
        onTap: onPressed,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              // TODO: theme color
              color: IconTheme.of(context).color,
            ),
          ),
          child: result,
        ),
      ),
    );
  }
}
