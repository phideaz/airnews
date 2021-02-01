part of 'screens.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "/register_screen";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String nama = "",pass = "",email = "";
  bool isLoading = false;

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
                  "REGISTER",
                  style: kJudulTextStyle,
                ),
              ),
            ),
            TextFormCustom(
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                    nama = value;
                  });
                },
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
                onChanged: (value){
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: kJudulTextStyle.copyWith(fontSize: 16,color: Colors.grey),
                  border: InputBorder.none,
                ),
                style: kJudulTextStyle.copyWith(fontSize: 16,color: Colors.black),
              ),
            ),
            SizedBox(height: 20,),
            TextFormCustom(
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                    pass = value;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: kJudulTextStyle.copyWith(fontSize: 16,color: Colors.grey),
                  border: InputBorder.none,
                ),
                style: kJudulTextStyle.copyWith(fontSize: 16,color: Colors.black),
              ),
            ),
            SizedBox(height: 40,),
            DefaultButton(
              text: "Register",
              onTap: () async {
                if(nama.isEmpty || email.isEmpty || pass.isEmpty){
                  flushError(context,message: "Please Enter the blank field");
                }else{
                  setState(() {
                    isLoading = true;
                  });

                  try{
                    final newUser = await context.read<AuthenticationProvider>().signUpEmailandPass(email: email, password: pass);
                    if(newUser){
                      Navigator.pushReplacementNamed(context, MainScreen.routeName);
                    }
                    else{
                      flushError(context,message: "Incorrect email or password");
                    }
                    setState(() {
                      isLoading = false;
                    });
                  }catch(e){
                    setState(() {
                      isLoading = false;
                    });
                    print(e);
                  }

                }
              },
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Login",
                  style: kJudulTextStyle.copyWith(color: Colors.grey,fontSize: 16),
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
