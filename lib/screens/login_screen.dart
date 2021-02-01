part of 'screens.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "", password = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kBackgroundColor,
        body: Form(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    "LOGIN",
                    style: kJudulTextStyle,
                  ),
                ),
              ),
              TextFormCustom(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: kJudulTextStyle.copyWith(fontSize: 16,color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  style: kJudulTextStyle.copyWith(fontSize: 16,color: Colors.black),
                  onChanged: (value){
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20,),
              TextFormCustom(
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: kJudulTextStyle.copyWith(fontSize: 16,color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  style: kJudulTextStyle.copyWith(fontSize: 16,color: Colors.black),
                  onChanged: (value){
                    setState(() {
                      password = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, LupaPasswordScene.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 40),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Lupa Password ?",
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              DefaultButton(
                text: "Masuk",
                onTap: ()async{
                  if(email.isEmpty && password.isEmpty){
                    flushError(context,message: "Please Enter email and your password");
                  }else if(email.isNotEmpty && password.isEmpty){
                    flushError(context,message: "Please Enter your password");
                  }else if(email.isEmpty && password.isNotEmpty){
                    flushError(context,message: "Please Enter your email");
                  }else if(email.isNotEmpty && password.length < 6){
                    flushError(context,message: "Your password must be 6 length or more");
                  }
                  else{
                    setState(() {
                      isLoading = true;
                    });
                    try{
                      final newUser = await context.read<AuthenticationProvider>().signInEmailandPass(email: email, password: password);
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
                      print(e);
                      setState(() {
                        isLoading = false;
                      });
                      flushError(context,message: "Incorrect email or password");
                    }


                  }

                },
              ),
              SizedBox(height: 20,),
              isLoading ? CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(kPrimaryColor),
              ) : SizedBox(),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                child: Column(
                  children: [
                    Text(
                      "Atau masuk dengan",
                      style: kJudulTextStyle.copyWith(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600)
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconSocialMedia(
                          icon: "assets/icons/facebook.svg",
                          onTap: (){},
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        IconSocialMedia(
                          icon: "assets/icons/google.svg",
                          onTap: (){
                            context.read<AuthenticationProvider>().signInWithGoogle();
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 120,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Daftar",
                          style: kJudulTextStyle.copyWith(color: Colors.grey,fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


