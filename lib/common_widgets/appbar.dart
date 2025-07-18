import 'package:flutter/material.dart';

class BuildAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppbar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.brown,
    );
  }
}
