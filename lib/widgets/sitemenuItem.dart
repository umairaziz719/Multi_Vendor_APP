import 'package:flutter/material.dart';

import 'horizontalMenuItem.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const SideMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalMenuItem(itemName: itemName, onTap: onTap);
  }
}
