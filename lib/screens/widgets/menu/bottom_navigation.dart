import 'package:flutter/material.dart';

class ItemData {
  final IconData icon;
  final IconData alternate;
  final String label;
  final bool disable;
  final bool badge;
  final int badgeValue;
  const ItemData({
    required this.icon,
    required this.label,
    required this.alternate,
    this.disable = false,
    this.badge = false,
    this.badgeValue = 0,
  });
}

class NavigationDecoration {
  Color? backgroundColor;
  Color? selectedColor;
  Color? unselectedColor;
  double fontSize;
  Color? itemBackground;
  double radius;
  double itemRadius;
  Duration duration;
  double iconSize;

  NavigationDecoration({
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.fontSize = 16,
    this.itemRadius = 30,
    this.itemBackground,
    this.radius = 18,
    this.iconSize = 24,
    this.duration = const Duration(milliseconds: 500),
  });
}

class AnimatedNavigationWidget extends StatefulWidget {
  const AnimatedNavigationWidget({
    super.key,
    required this.onTap,
    required this.currentIndex,
    required this.item,
    required this.navigationDecoration,


  });

  final int currentIndex;
  final List<ItemData> item;
  final ValueChanged<int> onTap;
  final NavigationDecoration navigationDecoration;


  @override
  State<AnimatedNavigationWidget> createState() => _AnimatedNavigationWidgetState();
}

class _AnimatedNavigationWidgetState extends State<AnimatedNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme
        .of(context)
        .colorScheme;
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: widget.navigationDecoration.backgroundColor ?? colorScheme.primary,
        borderRadius: BorderRadius.circular(widget.navigationDecoration.radius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < widget.item.length; i++) _menuItem(i, widget.item[i], widget.onTap)
        ],
      ),
    );
  }

  Widget _menuItem(int idx, ItemData item, ValueChanged<int> onTap) {
    final colorScheme = Theme
        .of(context)
        .colorScheme;
    final textTheme = Theme
        .of(context)
        .textTheme;
    bool itemSelected = widget.currentIndex == idx;

    Widget getIcon() {
      return Icon(
        itemSelected ? item.icon : item.alternate,
        color: itemSelected
            ? widget.navigationDecoration.selectedColor ?? colorScheme.primaryContainer
            : widget.navigationDecoration.unselectedColor ?? colorScheme.secondaryContainer,
        size: widget.navigationDecoration.iconSize,
      );
    }


    return InkWell(
      onTap: item.disable ? null : () => onTap(idx),
      child: AnimatedContainer(
        duration: widget.navigationDecoration.duration,
        padding: const EdgeInsets.all(8),
        constraints: BoxConstraints(
          maxWidth: itemSelected ? _itemSize(item.label) + 50 : 40,
          maxHeight: 40,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.navigationDecoration.itemRadius),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(item.badge)
              Badge(
                label: Text('${item.badgeValue}'),
                child: getIcon(),
              )
            else
              getIcon(),
            if (itemSelected)
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    item.label,
                    style: textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  double _itemSize(String label) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: Theme
            .of(context)
            .textTheme
            .titleMedium,
      ),
      textScaleFactor: MediaQuery
          .of(context)
          .textScaleFactor,
      textDirection: TextDirection.ltr,
    )
      ..layout();
    return textPainter.size.width;
  }
}
