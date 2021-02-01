part of 'widgets.dart';

class ListNews extends StatelessWidget {

  final String title;
  final String author;
  final String image;


  ListNews({this.title, this.author, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0.1,
                blurRadius: 5,
                offset: Offset(0,1)
            )
          ]
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: kJudulTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 15
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    author,
                    style: kJudulTextStyle.copyWith(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 13,
                        fontWeight: FontWeight.w300
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
