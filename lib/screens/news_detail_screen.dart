part of 'screens.dart';

class NewsDetailScreen extends StatelessWidget {
  static String routeName = "/news_detail_screen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Hero(
              tag: "imageBerita",
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://akcdn.detik.net.id/visual/2020/06/08/anies-baswedan-1_169.jpeg?w=650"))),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
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
              bottom: 0,
              left: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: SizedBox(
                      child: Text(
                        "Ali Lubis: Kalau Anis Tak Sanggup Urus Covid-19, Mundur Dong",
                        style: kJudulTextStyle.copyWith(
                            color: Colors.white, fontSize: 22),
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                      width: MediaQuery.of(context).size.width - 30,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CNN Indonesia",
                                style: kJudulTextStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "28 Jan 2021",
                                style: kJudulTextStyle.copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Jakarta, CNBC Indonesia - Indeks Harga Saham Gabungan (IHSG) dibuka terkoreksi pada perdagangan Selasa (26/1/21), turun tipis 0,09% ke level 6.252,71. Sempat anjlok parah hingga 0,80% IHSG sukses reb…",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            right: 15,
                            bottom: 15,
                            child: RaisedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text(
                                    "Sumber",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                    size: 18,
                                  )
                                ],
                              ),
                              color: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                            ))
                      ],
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
