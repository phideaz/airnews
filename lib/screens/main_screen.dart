part of 'screens.dart';

class MainScreen extends StatelessWidget {
  static String routeName = "/main_screen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/2,
                color: kPrimaryColor,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "AIRNEWS",
                        style: kJudulTextStyle.copyWith(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, ProfileScreen.routeName);
                        },
                        child: Hero(
                          tag: "profileImage",
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage("https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //LIST VIEW INDEX 0
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, NewsDetailScreen.routeName);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: HeadlineNews(
                      title: "Ali Lubis: Kalau Anis Tak Sanggup Urus Covid-19, Mundur Dong",
                      image: "https://akcdn.detik.net.id/visual/2020/06/08/anies-baswedan-1_169.jpeg?w=650",
                      author: "CNN Indonesia",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //LIST VIEW INDEX SELANJUTNYA
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ListNews(
                    image: "https://cdn0-production-images-kly.akamaized.net/aLeNjqgKIZ1TmbXsniitScnm5DA=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/thumbnails/2936002/original/024072400_1570707737-kang-sora-puji-akting-sheryl-sheinafia-di-film-bebas-rev-2dc876.jpg",
                    title: "Duh Ramai-ramai Kabur! Asing Lego 5 Saham Blue Chip",
                    author: "CNBC Indonesia",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


