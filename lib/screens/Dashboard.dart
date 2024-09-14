import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payjet/screens/MainHome.dart';



class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController pageController = PageController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void onItemTapped(int selectedItems) {
    pageController.jumpToPage(selectedItems);
    setState(() {
      _selectedIndex = selectedItems;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: PageView(
          onPageChanged: (value) {
            HapticFeedback.lightImpact();
          },
          controller: pageController,
          children: [
            Mainhome(),


          ],
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -1),
                blurRadius: 10,
                color: (_selectedIndex != 0)
                    ? Colors.grey.withOpacity(0.5)
                    : Colors.grey.withOpacity(0),
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            selectedFontSize: 12.0,
            unselectedFontSize: 9.0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    _selectedIndex == 0
                        ? Image.asset(
                      'assets/activehome.png',
                      width: 20,
                      height: 20,

                    )
                        : Image.asset(
                      'assets/inactivehome.png',
                      width: 25,
                      height: 25,
                    ),
                    Text("Home",style: TextStyle( color:_selectedIndex==0 ? Color(0xff330066)
                            : Color(0xff000000),),),
                  ],
                ),
                label: 'Home',
              ),

              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    _selectedIndex == 1
                        ? Image.asset(
                      'assets/activedoc.png',
                      width: 20,
                      height: 20,

                    )
                        : Image.asset(
                      'assets/inactiveDoc.png',
                      width: 26,
                      height: 26,
                    ),
                    Text("Epos Settlement",style: TextStyle( color:_selectedIndex==1 ? Color(0xff330066)
        : Color(0xff000000),),),
                  ],
                ),
                label: 'Epos Settlement',
              ),

              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    _selectedIndex == 2
                        ? Image.asset(
                      'assets/activeabout.png',
                      width: 20,
                      height: 20,
                      color:_selectedIndex==2 ? Color(0xff330066)
                          : Color(0xff00000),
                    )
                        : Image.asset(
                      'assets/about.png',
                      width: 25,
                      height: 25,
                    ),
                    Text("Complain",style: TextStyle( color:_selectedIndex==2 ? Color(0xff330066)
                        : Color(0xff000000),),),
                  ],
                ),
                label: 'Complain',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    _selectedIndex == 3
                        ? Image.asset(
                      'assets/activeperson.png',
                      width: 20,
                      height: 20,
                      color:_selectedIndex==3 ? Color(0xff330066)
                      : Color(0xff00000),
                    )
                        : Image.asset(
                      'assets/inactiveperson.png',
                      width: 25,
                      height: 25,
                    ),
                    Text("Payout",style: TextStyle( color:_selectedIndex==3? Color(0xff330066)
        : Color(0xff000000),),),
                  ],
                ),
                label: 'Payout',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: onItemTapped,
          ),
        ),
      ),
    );

  }
}
