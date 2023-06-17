import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/src/parameter/loginParameters/signInParameter.dart';

class signInPage extends StatefulWidget {
  const signInPage({super.key});

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    var screenInfo = MediaQuery.of(context);
    final double screenWidth = screenInfo.size.width;
    final double screenHeight = screenInfo.size.height;

    var usernameController = TextEditingController(text: username);
    var passwordController = TextEditingController(text: password);

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: screenWidth * (90 / 100),
              child: TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                    hintText: "Kullanıcı Adı", border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: (95 / 100)),
            SizedBox(
              width: screenWidth * (90 / 100),
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Şifre", border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(onPressed: signIn, child: Text("Kayıt Ol"))
          ],
        ),
      ),
    ));
  }

  void signIn() {
    signInParameter signIn = signInParameter();

    signIn.username = username;
    signIn.password = password;
    Map<String, signInParameter> signInPar = HashMap<String, signInParameter>();
    //signInPar.add('A', signIn);

    var httpUri = Uri(
        host: "localhost:1521",
        path: "/app/shopping/singIn",
        queryParameters: signInPar);
// httpUri
    var response = http.post(httpUri, body: signIn);

    if (response != null) {}
    /*ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Kayıt Ol Aktif")));*/
  }
}
