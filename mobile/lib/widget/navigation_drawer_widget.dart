import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:mobile/page/agent_page.dart';
import 'package:mobile/page/buy_page.dart';
import 'package:mobile/page/index_page.dart';
import 'package:mobile/page/profile_page.dart';
import 'package:mobile/page/rent_page.dart';
import 'package:mobile/page/services_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const name = 'Youssef Farhat';
    const email = 'Youssef@gmail.com';
    const urlImage =
        'https://scontent.ftun9-1.fna.fbcdn.net/v/t1.6435-9/81098081_2815874341798217_8909688804038672384_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=98tiF9PBgmwAX-CBzZQ&_nc_ht=scontent.ftun9-1.fna&oh=35969c2b5019bc2c111259bfbb833746&oe=61CAEF45';

    return Drawer(
      child: Material(
        color: Color.fromRGBO(212, 202, 104, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(

              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  buildSearchField(),
                  const Divider(color: Colors.white70),
                  ListTile(
                    leading: const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()),
                      )
                    },
                  ),
                  const Divider(color: Colors.white70),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IndexPage()),
                      ),
                    },
                  ),

                  ListTile(
                    leading: const Icon(
                      Icons.groups,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Agents',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AgentPage()),
                      ),
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.contact_mail,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Contact US',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => {},
                  ),
                  const Divider(color: Colors.white70),
                  ListTile(
                    leading: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Notifications',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      )
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      "made with",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 10,
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      "By FindState",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )),
              ],
            )
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
              Icon(Icons.edit, color: Colors.white),
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
    VoidCallback? onTap,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onTap,
    );
  }
}
