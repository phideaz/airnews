part of 'screens.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),(){
      auth.User user = auth.FirebaseAuth.instance.currentUser;

      if (user != null) {
        Navigator.popAndPushNamed(context, MainScreen.routeName);

      }else{
        Navigator.popAndPushNamed(context, LoginScreen.routeName);
      }
    });
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/2,
                color: kPrimaryColor,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/icon.png",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Banyak hal yang bisa dibaca loh.\nAyo rajin membaca untuk menambah pengetahuanmu.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30,),
                  CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(kPrimaryColor),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "v1.0",
                  textAlign: TextAlign.center,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}



