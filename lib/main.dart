import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'View/home_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual , overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntoScreen(),
    );
  }
}

class IntoScreen extends StatefulWidget {
  const IntoScreen({super.key});

  @override
  State<IntoScreen> createState() => _IntoScreenState();
}

class _IntoScreenState extends State<IntoScreen>
    with SingleTickerProviderStateMixin {
  static var myNewFont = const TextStyle(
      color: Colors.black, letterSpacing: 3, fontFamily: 'Press Start 2P');
  static var myNewFontWhite = const TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 15,
      fontFamily: 'Press Start 2P');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Text(
                  "TIK TAC TOE",
                  style: myNewFontWhite.copyWith(fontSize: 30),
                ),
              )),
              Expanded(
                  flex: 2,
                  child: AvatarGlow(
                    duration: const Duration(seconds: 2),
                    glowColor: Colors.white,
                    repeat: true,
                    startDelay: const Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(style: BorderStyle.none)),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[900],
                        child: Container(
                          child:  Image.asset(
                            'assets/images/logo.png',
                            // color: Colors.white,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        radius: 90,
                      ),
                    ),
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  "@CREATED BY HASNAOUI",
                  style: myNewFontWhite.copyWith(fontSize: 20),
                ),
              )),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeGame()));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 60),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          "PLAY GAME",
                          style: myNewFont,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
