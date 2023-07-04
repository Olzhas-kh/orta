import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/resources/app_svg_images.dart';
import 'package:orta/screens/events.dart';
import 'package:orta/screens/my_events_screens/my_events_screen.dart';
import 'package:orta/screens/organization_event_screens/organization_main.dart';
import 'package:orta/screens/profile_screen.dart';

import '../resources/app_styles.dart';
class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget> [
    const Events(),
    const MyEventsPage(),
    const OrganizationMain(),
    const ProfilePage(),
  ];
  void _onItemTapped (int index){
    setState(() {
      
    _selectedIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(child:_widgetOptions[_selectedIndex],),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color(0xFF526480),
        type: BottomNavigationBarType.fixed,
        items: [
        BottomNavigationBarItem(icon: SvgPicture.asset(AppSvgImages.homeBottomIcon, color:_selectedIndex==0? Styles.blueAppColor:Styles.black,),label: "Home"),
        BottomNavigationBarItem(icon:  SvgPicture.asset(AppSvgImages.myEventsBottomIcon,color: _selectedIndex==1? Styles.blueAppColor:Styles.black,), label: "My events"),
        BottomNavigationBarItem(icon:  SvgPicture.asset(AppSvgImages.organizationBottomIcon,color:_selectedIndex==2? Styles.blueAppColor:Styles.black,), label: "Organization"),
        BottomNavigationBarItem(icon:  SvgPicture.asset(AppSvgImages.profileBottomIcon,color:_selectedIndex==3? Styles.blueAppColor:Styles.black,),label: "Profile"),
        
      ]),
    );
  }
}