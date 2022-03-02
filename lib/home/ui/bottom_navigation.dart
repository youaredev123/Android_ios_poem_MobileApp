import 'package:flutter/material.dart';
import 'package:poem_mobile/claim/claims/ui/claim_page.dart';

class BottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedItemColor: Colors.black,
      currentIndex: 0,
      onTap: (int index) {
        if(index == 0) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ClaimPage()));
        } else if(index == 1) {

        } else if(index ==2) {

        } else if(index == 3) {
          Scaffold.of(context).openDrawer();
        }
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            // backgroundColor: Colors.blue,
            icon: Image.asset('assets/images/icon_tab1.png',
                width: 25, height: 25),
            title: Text('Claims',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
        BottomNavigationBarItem(
            // backgroundColor: Colors.green,
            icon: Image.asset('assets/images/icon_tab2.png',
                width: 25, height: 25),
            title: Text('Gifts',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
        BottomNavigationBarItem(
            icon: Image.asset('assets/images/icon_tab3.png',
                width: 25, height: 25),
            title: Text('Ratings',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
        BottomNavigationBarItem(
            icon: Image.asset('assets/images/icon_tab4.png',
                width: 25, height: 25),
            title: Text('More',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
      ],
    );
  }
}
