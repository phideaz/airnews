part of 'screens.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile_screen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  "PROFILE",
                  style: kJudulTextStyle,
                ),
              ),
            ),
            Hero(
              tag: "profileImage",
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage("https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormCustom(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Nama",
                  hintStyle: kJudulTextStyle.copyWith(fontSize: 16,color: Colors.grey),
                  border: InputBorder.none,
                ),
                style: kJudulTextStyle.copyWith(fontSize: 16,color: Colors.black),
              ),
            ),
            SizedBox(height: 20,),
            TextFormCustom(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: kJudulTextStyle.copyWith(fontSize: 16,color: Colors.grey),
                  border: InputBorder.none,
                ),
                style: kJudulTextStyle.copyWith(fontSize: 16,color: Colors.black),
              ),
            ),
            SizedBox(height: 40,),
            DefaultButton(
              text: "Simpan",
              onTap: (){},
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                context.read<AuthenticationProvider>().signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(SplashScreen.routeName, (Route<dynamic> route) => false);
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Logout",
                  style: kJudulTextStyle.copyWith(color: kPrimaryColor,fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
