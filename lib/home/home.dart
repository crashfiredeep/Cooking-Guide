import 'package:cooking_guide/discover/discover.dart';
import 'package:cooking_guide/home/home_list.dart';
import 'package:cooking_guide/services/auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final titles = ["Cooking Guide", "Discover", "Favorite", "Guide", "Feed"];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titles[currentIndex]),
          actions: this.currentIndex == 0 ? <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person_pin_circle),
              onPressed: () async {
                AuthService().signOut();
              },
            ),
          ]:null,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          height: 60,
          color: Colors.deepPurple,
          onTap: (index) => _setIndex(index),
          items: <Widget>[
            Icon(
              Icons.apps,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.list,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite_border,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.medkit,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.rss_feed,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
        body: _setScreen());
  }
  _setScreen(){
     switch (this.currentIndex) {
      case 0:
        return HomeList();
        break;
      case 1:
        return Discover();
        break;
      case 2:
        return Text("Screen $currentIndex");
        break;
      case 3:
        return Text("Screen $currentIndex");
        break;
      case 4:
        return Text("Screen $currentIndex");
        break;
      default:
    }
  }
  _setIndex(int index) {
    setState(() => currentIndex = index);
    _setScreen();
  }
}
