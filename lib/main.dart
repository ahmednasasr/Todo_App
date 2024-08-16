import 'package:flutter/material.dart';
import 'package:todo_app/module/screens/layout_screen.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'core/main_provider.dart';
import 'core/theme.dart';
import 'module/splash/spalsh_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      fallbackLocale: Locale('en'),
        child: ChangeNotifierProvider(
          create: (context) => mainprovider(),
          child:const TodoApp(),)
      ),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<mainprovider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: apptheme.lighttheme,
      darkTheme: apptheme.darktheme,
      themeMode: provider.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        SpalshScreen.routename: (_) => SpalshScreen(),
        LayoutScreen.routename: (_) => LayoutScreen(),
      },
      initialRoute: SpalshScreen.routename,
    );
  }
}

