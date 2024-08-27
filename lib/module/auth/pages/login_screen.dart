import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../manger/auth_provider.dart';
import 'creat_account_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "loginScreen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Container(
          width: double.infinity,
          // height: double.infinity,
          decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,),
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: theme.primaryColor,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      TextFormField(
                        style: TextStyle(color: theme.textTheme.bodyMedium?.color),
                        controller: provider.emailController,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: theme.textTheme.bodyMedium?.color),
                            hintText: "Email",
                            labelText: "Email",
                            labelStyle:  TextStyle(color: theme.textTheme.bodyMedium?.color),
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextFormField(
                        style: TextStyle(color: theme.textTheme.bodyMedium?.color),
                        controller: provider.passwordController,
                        obscureText: provider.isSecure,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.password),
                            hintText: "Password",
                            hintStyle: TextStyle(color: theme.textTheme.bodyMedium?.color),
                            labelStyle:  TextStyle(color: theme.textTheme.bodyMedium?.color),
                            labelText: "Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  provider.changeSecure();
                                },
                                icon: Icon(provider.isSecure
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.blue),
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: InkWell(
                                onTap: () async {
                                  await provider.login(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.login,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, CreateAccountScreen.routeName);
                          },
                          child: const Text(
                              "You dont have account ..? Create Now"))
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}