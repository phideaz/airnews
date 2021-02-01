part of 'widgets.dart';

void flushError(BuildContext context, {@required String message}){
  Flushbar(
    message: message,
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.white,
    ),
    duration: Duration(seconds: 3),
    backgroundColor: kPrimaryColor,
  )..show(context);
}