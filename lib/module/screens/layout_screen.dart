// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/module/screens/home_screen.dart';
// import 'package:todo_app/module/screens/settings_screen.dart';
// import '../../core/main_provider.dart';
// import '../widgets/addtaskwidget.dart';
//
// class LayoutScreen extends StatelessWidget {
//   LayoutScreen({super.key});
//   static const String routename="Layout";
//   List<Widget> screens=[
//     HomeScreen(),
//     SettingsScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context)=> mainprovider(),
//       child: Selector<mainprovider,int>(
//         selector: (p0, p1) => p1.selectindex,
//         builder: (context, selectindex, child) {
//           var provider = Provider.of<mainprovider>(context,listen: false);
//           return  Scaffold(
//             backgroundColor: Theme.of(context).primaryColor,
//             floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//             floatingActionButton: FloatingActionButton(
//               shape: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(360),
//                   borderSide: BorderSide(color: Colors.white,width: 4)
//               ), onPressed: (){
//                showModalBottomSheet(
//                  showDragHandle: true,
//                  context: context, builder: (context) {
//                  return ChangeNotifierProvider.value(
//                    value: provider,
//                      child: addtaskwidget());
//                },);
//             },
//               child: Icon(Icons.add),),
//             bottomNavigationBar: BottomAppBar(
//               shape: CircularNotchedRectangle(),
//               notchMargin: 8,
//               color: Colors.white,
//               child: BottomNavigationBar(
//                   backgroundColor: Colors.transparent,
//                   elevation: 0,
//                   onTap: (value){
//                     provider.selectedindex(value);
//                   },
//                   currentIndex: selectindex,
//                   items: [
//                     BottomNavigationBarItem(icon: Icon(Icons.menu),label: "menu".tr()),
//                     BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings".tr())
//                   ]),
//             ),
//             body: screens[provider.selectindex],
//           );
//         },
//       ),
//     );
//   }
// }
//
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/module/screens/home_screen.dart';
import 'package:todo_app/module/screens/settings_screen.dart';
import '../../core/main_provider.dart';
import '../widgets/addtaskwidget.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});
  static const String routename="Layout";
  List<Widget> screens=[
    HomeScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Selector<mainprovider,int>(
        selector: (p0, p1) => p1.selectindex,
        builder: (context, selectindex, child) {
          var provider = Provider.of<mainprovider>(context,listen: false);
          return  Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(360),
                  borderSide: BorderSide(color: Colors.white,width: 4)
              ), onPressed: (){
              showModalBottomSheet(
                showDragHandle: true,
                context: context, builder: (context) {
                return ChangeNotifierProvider.value(
                    value: provider,
                    child: addtaskwidget());
              },);
            },
              child: Icon(Icons.add),),
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 8,
              color: Colors.white,
              child: BottomNavigationBar(
                  backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                  unselectedItemColor: Colors.white,
                  elevation: 0,
                  onTap: (value){
                    provider.selectedindex(value);
                  },
                  currentIndex: selectindex,
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.menu),label: "menu".tr()),
                    BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings".tr())
                  ]),
            ),
            body: screens[provider.selectindex],
          );
        },
    );
  }
}



