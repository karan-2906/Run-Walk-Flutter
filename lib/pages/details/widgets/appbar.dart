import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appBar;

  const   MainAppBar({
    super.key,
    required this.appBar,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 16,
        ),
      ),
      title: Text(
        'Activity Details',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(5),
            shape: CircleBorder(),
            backgroundColor: Color(0xffffe6da),
          ),
          child: Icon(
            Icons.notifications,
            size: 16,
          ),
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
