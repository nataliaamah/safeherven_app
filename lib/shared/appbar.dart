import 'package:flutter/material.dart';
import 'package:safeherven_app/screens/settings/settings.dart';

class SafeHervenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isHome;

  const SafeHervenAppBar(this.title, {Key? key, required this.isHome})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isHome == false ? false : true,
      title: isHome == false
          ? Text(title)
          : Image.asset(
              'assets/images/logos/white.png',
              height: 50,
            ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.white)
          ),
          child: PopupMenuButton<int>(
            color: Colors.purple,
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: const [
                      Icon(Icons.settings, color: Colors.white,),
                      SizedBox(width: 8,),
                      Text("Settings", style: TextStyle(
                          color: Colors.white
                      ),)
                    ],
                  )
              ),
              const PopupMenuDivider(),
              PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children:  const [
                      Icon(Icons.logout, color: Colors.white,),
                      SizedBox(width: 8,),
                      Text("Logout", style: TextStyle(
                          color: Colors.white
                      ),)
                    ],
                  )
              ),
            ]
          ),
        ),
      ],
    );
  }

  onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsScreen()),
        );
        break;
      case 1:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const SignInScreen()),
        // );
        // (route) => false;
        break;
    }
  }
}