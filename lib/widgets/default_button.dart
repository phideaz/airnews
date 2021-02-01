part of 'widgets.dart';

class DefaultButton extends StatelessWidget {

  final String text;
  final Function onTap;


  DefaultButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width/2.5,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28,vertical: 14),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: kJudulTextStyle.copyWith(color: Colors.white,fontSize: 16),
          ),
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
