part of 'widgets.dart';

class TextFormCustom extends StatelessWidget {
  final Widget child;


  TextFormCustom({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration: kBoxDecTextField,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 3),
        child: child,
      ),

    );
  }
}
