import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/src/login/signInPage.dart';
import 'package:shopping/src/parameter/loginParameters/loginParameter.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    var screenInfo = MediaQuery.of(context);
    final double screenWidth = screenInfo.size.width;
    final double screenHeight = screenInfo.size.height;

    //const textFieldController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
                child: Column(
              children: [
                Text("Shopping"),
                Text("Online.."),
              ],
            )),
            SizedBox(height: 50),
            SizedBox(
              width: screenWidth * (95 / 100),
              child: TextField(
                controller: TextEditingController(text: username),
                decoration: const InputDecoration(
                    hintText: "Kullanıcı Adı", border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 90 / 100),
            SizedBox(
              width: screenWidth * (95 / 100),
              child: TextField(
                controller: TextEditingController(text: password),
                decoration: const InputDecoration(
                    hintText: "Şifre", border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(onPressed: loginMethod, child: const Text("Giriş")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Üyeliğiniz yok ise"),
                TextButton(
                    onPressed: openSingUpPage, child: const Text("Kayıt Ol")),
              ],
            )
          ]),
        ),
      ),
    );
  }

  void loginMethod() {
    //HttpRequest.request("", );
    loginParameter parameter =
        loginParameter(username: username, email: username, password: password);
    var httpsUri = Uri(
      scheme: "http",
      host: "localhost",
      path: "/app/shopping/loginPage/login",
      //queryParameters:
    );
    var response = http.get(httpsUri);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Giriş Yap Butonu Aktif")));
  }

  void openSingUpPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const signInPage()));
  }
}
