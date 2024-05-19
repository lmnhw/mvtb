import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvtb/data/tab_list.dart';
import 'package:mvtb/pages/booking_page.dart';
import 'package:mvtb/pages/home_page.dart';
import 'package:mvtb/pages/saved_booking.dart';
import 'package:mvtb/utils/styles.dart';
import 'package:mvtb/widgets/dotted_container.dart';
import 'package:mvtb/widgets/svg_icon.dart';



final List<Widget> _widgetOptions = <Widget>[
  const Home(),
  const BookingPage(),
  const SavedBooking(),
];

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        backgroundColor: Styles.appBarColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: tabList.map<BottomNavigationBarItem>((item) {
          return BottomNavigationBarItem(
            icon: DottedContainer(
                child: SvgIcon(assetName: item)
            ),
            label: 'Home',
          );
        }).toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}