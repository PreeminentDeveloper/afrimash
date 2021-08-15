import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DynamicTextItem {
  final String key;
  final String text;
  final Widget widget;
  final Function onTap;

  DynamicTextItem({
    @required this.key,
    this.widget,
    this.onTap,
    this.text,
  });
}

class DynamicText extends StatelessWidget {
  final String text;
  final List<DynamicTextItem> itemEvent;
  final TextStyle style;
  final TextStyle styleItemEvent;

  DynamicText({
    Key key,
    this.text,
    this.itemEvent,
    this.style,
    this.styleItemEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mathText = text.split(' ');

    final _style = style ?? TextStyle(color: Theme.of(context).accentColor);
    final _styleItemEvent =
        styleItemEvent ?? TextStyle(color: Theme.of(context).primaryColor);
    return RichText(
      text: TextSpan(
        children: List.generate(
          mathText?.length ?? 0,
          (index) {
            final indexEvent =
                itemEvent?.indexWhere((e) => e.key == mathText[index]) ?? -1;
            var isWidget = false;
            if (indexEvent != -1) {
              isWidget = itemEvent[indexEvent]?.widget != null;
            }

            return TextSpan(
              text: isWidget
                  ? null
                  : '${indexEvent != -1 ? itemEvent[indexEvent].text : mathText[index]} ',
              children: isWidget
                  ? [WidgetSpan(child: itemEvent[indexEvent].widget)]
                  : null,
              recognizer: indexEvent != -1 && !isWidget
                  ? (TapGestureRecognizer()
                    ..onTap = itemEvent[indexEvent].onTap)
                  : null,
              style: indexEvent != -1 ? _styleItemEvent : _style,
            );
          },
        ),
      ),
    );
  }
}