part of 'widgets.dart';

class HeadlineNews extends StatelessWidget {
  final String title;
  final String author;
  final String image;


  HeadlineNews({this.title, this.author, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: Offset(0,1)
            )
          ]
      ),
      child: Stack(
        children: [
          Hero(
            tag: "imageBerita",
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.black.withOpacity(0.3)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    title,
                    style: kJudulTextStyle.copyWith(
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  author,
                  style: kJudulTextStyle.copyWith(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w300
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
