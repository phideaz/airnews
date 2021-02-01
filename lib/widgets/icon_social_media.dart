part of 'widgets.dart';

class IconSocialMedia extends StatelessWidget {

  final String icon;
  final Function onTap;


  IconSocialMedia({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SvgPicture.asset(
            icon,
          ),
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0,2),
              )
            ]
        ),
      ),
    );
  }
}
