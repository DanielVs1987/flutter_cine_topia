import 'package:flutter/material.dart';
import 'package:flutter_cine_topia/ui/componets/buttons.dart';
import 'package:flutter_cine_topia/ui/screens/dashbord.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color(0xff000000),
            Color(0xff1d0e44),
          ], begin: Alignment.topCenter),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Image.asset("assets/logo.png"),
                ),
                Image.asset("assets/splash.png"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                PrimaryButton(
                  text: "Quero começar!",
                  icon: Icons.arrow_forward,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashbord(),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
