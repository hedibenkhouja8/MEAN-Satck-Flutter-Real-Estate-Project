import 'package:flutter/material.dart';
import 'package:mobile/page/Servives_page.dart';
import 'package:mobile/page/buy_page.dart';
import 'package:mobile/page/profile_page.dart';
import 'package:mobile/page/rent_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Youssef Farhat';
    final email = 'Youssef@gmail.com';
    final urlImage =
        'https://scontent.ftun9-1.fna.fbcdn.net/v/t1.6435-9/81098081_2815874341798217_8909688804038672384_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=98tiF9PBgmwAX-CBzZQ&_nc_ht=scontent.ftun9-1.fna&oh=35969c2b5019bc2c111259bfbb833746&oe=61CAEF45';

    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfilePage(),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildSearchField(),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Profile',
                    icon: Icons.account_circle,
                    onClicked: () => {selectedItem(context, 0)},
                  ),
                  const SizedBox(height: 16),
                  Divider(color: Colors.white70),
                  buildMenuItem(
                    text: 'Home',
                    icon: Icons.home,
                    onClicked: () => {},
                  ),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Buy',
                    icon: Icons.monetization_on_outlined,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Rent',
                    icon: Icons.monetization_on_outlined,
                    onClicked: () => selectedItem(context,2),
                  ),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Services',
                    icon: Icons.paste_sharp,
                    onClicked: () => selectedItem(context,3 ),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'About Us',
                    icon: Icons.help,
                    onClicked: () =>{},
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Contact US',
                    icon: Icons.contact_mail,
                    onClicked: () => {},
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),

                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Notifications',
                    icon: Icons.notifications_outlined,
                    onClicked: () => {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Buy(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RentPage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Servives(),
        ));
        break;
    }
  }
}