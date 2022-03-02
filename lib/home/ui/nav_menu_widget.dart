import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

TextStyle menuItemStyle = TextStyle(color: Colors.grey, fontSize: 18);

class NavItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const NavItem({Key key, this.onTap, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(title, style: TextStyle(color: Colors.black, fontSize: 18, height: 1),),
          ),
        ],
      ),
    );
  }
}

class NavMenuWidget extends StatelessWidget {

  final ValueChanged<String> onMenuItemClicked;
  final VoidCallback onLogout;
  final VoidCallback onClose;
  const NavMenuWidget({Key key, this.onClose, @required this.onMenuItemClicked, @required this.onLogout}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 5, right: 45),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                SizedBox(height: 33),
                NavItem(
                  title: 'Member profile',
                  onTap: () {
                    Navigator.pop(context);
                    onMenuItemClicked('/memberProfile');
                  },
                ),
                NavItem(
                  title: 'Provider search',
                  onTap: () {
                    Navigator.pop(context);
                    onMenuItemClicked('/providerSearch');
                  },
                ),
               NavItem(
                 title: 'Search history',
                 onTap: () {
                   Navigator.pop(context);
                   onMenuItemClicked('/searchHistory');
                 },
               ),
               NavItem(
                 title: 'Referrals',
                 onTap: () {
                   Navigator.pop(context);
                   onMenuItemClicked('/referrals');
                 },
               ),
               NavItem(
                 title: 'Change username',
                 onTap: () {
                   Navigator.pop(context);
                   onMenuItemClicked('/changeUsername');
                 },
               ),
                NavItem(
                  title: 'Cancel service',
                  onTap: () {
                    Navigator.pop(context);
                    onMenuItemClicked('/serviceCancel');
                  },
                ),
                NavItem(
                  title: 'Log out',
                  onTap: () {
                    Navigator.pop(context);
                    onLogout();
                  },
                ),
                SizedBox(height: 50)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}