part of 'screens.dart';

class LupaPasswordScene extends StatelessWidget {
  static String routeName = "/lupa_password_screen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  "LUPA PASSWORD",
                  style: kJudulTextStyle,
                ),
              ),
            ),
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
              text: "Kirim",
              onTap: (){},
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Kembali",
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
