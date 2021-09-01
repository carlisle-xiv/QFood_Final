import 'package:q_food/Service.dart';
import 'package:q_food/services/firebase_services.dart';
import 'package:q_food/tabs/home_tab.dart';
import 'package:q_food/widgets/bottom_tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String routeName= "/HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseServices _firebaseServices = FirebaseServices();

  PageController _tabsPageController;
  //int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return new Scaffold(

      body: Stack(
        children: [
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Image(
                image: new AssetImage('assets/images/home.jpg'),//The background image of the app
                fit: BoxFit.cover,//make it fit the entire screen
                //color: Colors.black87,
                //colorBlendMode: BlendMode.darken,//Darken the image in the background
              ),
              Expanded(
                child: PageView(
                  controller: _tabsPageController,
                  onPageChanged: (num) {
                    setState(() {
                      //_selectedTab = num;
                    });
                  },
                  children: [
                    HomeTab(),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Container(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Service()
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.check_circle,
                      size: 50.0,
                    ),
                    label: Text("Head to checker"),
                  ),
                ),
              ),


              BottomTabs(
               // selectedTab: _selectedTab,
                tabPressed: (num) {
                  _tabsPageController.animateToPage(
                      num,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOutCubic);
                },
              ),

            ],
          ),
        ],
      ),
    );
  }
}



