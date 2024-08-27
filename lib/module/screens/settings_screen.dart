import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/main_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<mainprovider>(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
            Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.blue,
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Text(
                "settings".tr(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ),
          ],
        ),
            SizedBox(height: 20),
            Padding(
            padding: EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(width: 20),
                  Text(
                "language".tr(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<Locale>(
                    dropdownColor:Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.4),

                    value: context.locale,
                    onChanged: (Locale? newLocale) {
                      if (newLocale != null) {
                    context.setLocale(newLocale);
                  }
                },
                items: [
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text("english".tr(),style: TextStyle( color: Theme.of(context).textTheme.bodyMedium?.color,)),
                  ),
                  DropdownMenuItem(
                    value: Locale('ar'),
                    child: Text("arabic".tr(),style: TextStyle( color: Theme.of(context).textTheme.bodyMedium?.color,),),
                  ),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
                  SizedBox(height: 20,),
                  DropdownButtonFormField<ThemeMode>(
                    dropdownColor:Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.3),
                    value: provider.themeMode,
                onChanged: (ThemeMode? newmode) {
                  if (newmode != null) {
                    provider.changetheme(newmode);
                  }
                },
                items: [
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text("Light".tr(),style: TextStyle( color: Theme.of(context).textTheme.bodyMedium?.color,)),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text("Dark".tr(),style: TextStyle( color: Theme.of(context).textTheme.bodyMedium?.color,)),
                  ),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
                  SizedBox(height: 20,),
                  Consumer<mainprovider>(
                    builder: (context, provider, child) {
                      return Container(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){
                          provider.logout(context);
                        }, child: Text("Log out")),
                      );
                    },
                  )
            ]
                )

        )
      ]
          )
      ),
    );
  }
}
