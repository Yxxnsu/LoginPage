import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: GameLoginPage(),
    );
  }
}

class GameLoginPage extends StatefulWidget {
  @override
  _PageLoginGameState createState() => _PageLoginGameState();
}

class _PageLoginGameState extends State<GameLoginPage>
    with TickerProviderStateMixin {
  // var
  late AnimationController animationController;
  bool isDark = false;
  bool isPassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var
    isDark = Theme.of(context).brightness == Brightness.dark ? true : false;
    Color color1 = isDark ? Colors.black : Colors.purple;
    Color color2 =
        isDark ? Colors.purple.withOpacity(0.01) : Colors.purple[900]!;

    return Container(
      color: isDark ? Colors.black : Colors.white,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [color1, color2])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: body(context),
        ),
      ),
    );
  }

  /// WIDGETS
  Widget body(BuildContext context) {
    // var
    bool isDark =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    Color colorText1Dark = Colors.white;
    Color colorText2Dark = Colors.blue;
    Color colorText1light = Colors.purple[900]!;
    Color colorText2light = Colors.orange;
    Color colorText = Theme.of(context).brightness == Brightness.dark
        ? Colors.deepPurple
        : Colors.white;
    Color colorButton = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.deepPurple;

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[          
            Expanded(
                child: Center(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.gamepad,
                  size: 100.0,
                  color: isDark ? Colors.white : Colors.purple[900],
                ),
                SizedBox(height: 20.0),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("GAME",
                          style: GoogleFonts.poppins(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  isDark ? colorText1Dark : colorText1light)),
                      Text("CORES",
                          style: GoogleFonts.poppins(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: isDark ? colorText2Dark : colorText2light))
                    ]),
              ],
            ))),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Bounce(
                    controller: (controller) => animationController = controller,
                    child: isPassword ? formPaddword() : formEmail()),
                  SizedBox(height: 50.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0.0),
                      onPrimary: Colors.purple,
                      primary: colorButton,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      side: BorderSide(color: colorButton),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        child: Text(
                            isPassword
                                ? '앱에 접속합니다.'
                                : '비밀번호를 입력합니다.',
                            style: TextStyle(
                                color: colorText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold))),
                    onPressed: () => setState(() {
                      isPassword = !isPassword;
                      animationController.repeat();
                    }),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0.0),
                      onPrimary: colorButton,
                      primary: colorButton.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: colorButton)),
                      side: BorderSide(color: colorButton),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        child: Text("구글 로그인",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: colorButton,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold))),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),    
      ],
    );
  }

  /// WIDGETS COMPONENT
  Widget formEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(width: 2, color: Colors.white10.withOpacity(0.1))),
      child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
          controller: TextEditingController(text: ""),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20.0),
            hintText: "이메일을 입력해주세요!",
            hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none)),
    );
  }

  Widget formPaddword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(width: 2, color: Colors.white10.withOpacity(0.1))),
      child: TextField(
          obscureText: true,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
          controller: TextEditingController(text: ""),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20.0),
              hintText: "비밀번호를 입력해주세요!",
              hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none)),
    );
  }
}
