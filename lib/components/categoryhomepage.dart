import 'package:flutter/material.dart';

class Categorycomp extends StatelessWidget {
  const Categorycomp(
      {super.key,
      required isSelected,
      required index,
      required category,
      required icon,
      required callBack})
      : _isSelected = isSelected,
        _categoryName = category,
        _icon = icon,
        _index = index,
        _callBack = callBack;

  final int _isSelected;
  final int _index;
  final String _categoryName;
  final IconData _icon;
  final Function(int index) _callBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        _callBack(_index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.fromBorderSide(BorderSide(
              width: 1,
              color: _isSelected == _index
                  ? Colors.red
                  : Theme.of(context).colorScheme.secondary)),
          color: _isSelected == _index
              ? Colors.red
              : Theme.of(context).colorScheme.background,
        ),
        child: Row(
          children: [
            Icon(
              _icon,
              color: _isSelected == _index
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).colorScheme.secondary,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                _categoryName,
                style: TextStyle(
                    color: _isSelected == _index
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
