part of "../pages.dart";

class DetailChatPage extends StatefulWidget {
  const DetailChatPage({super.key});

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController chatController = TextEditingController();

  Widget listView1(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3, top: 5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: mainColor,
                  ),
                  child: Text('Selamat Pagi jkjashs hishui hfdsihiwe hifshi hhfeswi heiwhif s', style: blackFontStyle3.copyWith(color: Colors.white))),
              Container(margin: EdgeInsets.only(bottom: 2), child: Text('07:00', style: blackFontStyle3.copyWith(color: greyColor))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 3, top: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: "#771F98".toColor(), width: 1)),
                  child: Text('Halo selamat pagi, apakah ada yang bisa saya bantu ?', style: blackFontStyle3.copyWith(color: Colors.black))),
              Container(margin: EdgeInsets.only(bottom: 2), child: Text('07:01', style: blackFontStyle3.copyWith(color: greyColor))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3, top: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: mainColor,
                  ),
                  child: Text('Lorem Ipsum Dolor Sit Amet', style: blackFontStyle3.copyWith(color: Colors.white))),
              Container(margin: EdgeInsets.only(bottom: 2), child: Text('07:05', style: blackFontStyle3.copyWith(color: greyColor))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 3, top: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: "#771F98".toColor(), width: 1)),
                  child: Text('Lorem Ipsum DOlor Sit Amet Vsgah Khkh Hiii dnnnfkj', style: blackFontStyle3.copyWith(color: Colors.black))),
              Container(margin: EdgeInsets.only(bottom: 2), child: Text('07:05', style: blackFontStyle3.copyWith(color: greyColor))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3, top: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: mainColor,
                  ),
                  child: Text('Lorem Ipsum Dolor Sit Amet', style: blackFontStyle3.copyWith(color: Colors.white))),
              Container(margin: EdgeInsets.only(bottom: 2), child: Text('07:06', style: blackFontStyle3.copyWith(color: greyColor))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 3, top: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: "#771F98".toColor(), width: 1)),
                  child: Text('Lorem Ipsum DOlor Sit Amet Vsgah Khkh Hiii dnnnfkj', style: blackFontStyle3.copyWith(color: Colors.black))),
              Container(margin: EdgeInsets.only(bottom: 2), child: Text('07:06', style: blackFontStyle3.copyWith(color: greyColor))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3, top: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: mainColor,
                  ),
                  child: Text('Lorem Ipsum Dolor Sit Amet', style: blackFontStyle3.copyWith(color: Colors.white))),
              Container(margin: EdgeInsets.only(bottom: 2), child: Text('07:08', style: blackFontStyle3.copyWith(color: greyColor))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 3, top: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: "#771F98".toColor(), width: 1)),
                  child: Text('Lorem Ipsum DOlor Sit Amet Vsgah Khkh Hiii dnnnfkj', style: blackFontStyle3.copyWith(color: Colors.black))),
              Container(margin: EdgeInsets.only(bottom: 2), child: Text('07:09', style: blackFontStyle3.copyWith(color: greyColor))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3, top: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: mainColor,
                  ),
                  child: Text('Lorem Ipsum Dolor Sit Amet', style: blackFontStyle3.copyWith(color: Colors.white))),
              Container(margin: EdgeInsets.only(bottom: 2), child: Text('07:12', style: blackFontStyle3.copyWith(color: greyColor))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 3, top: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: "#771F98".toColor(), width: 1)),
                  child: Text('Lorem Ipsum DOlor Sit Amet Vsgah Khkh Hiii dnnnfkj', style: blackFontStyle3.copyWith(color: Colors.black))),
              Container(margin: EdgeInsets.only(bottom: 2), child: Text('07:12', style: blackFontStyle3.copyWith(color: greyColor))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3, top: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: mainColor,
                  ),
                  child: Text('Lorem Ipsum Dolor Sit Amet', style: blackFontStyle3.copyWith(color: Colors.white))),
              Container(margin: EdgeInsets.only(bottom: 2), child: Text('07:12', style: blackFontStyle3.copyWith(color: greyColor))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 3, top: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: "#771F98".toColor(), width: 1)),
                  child: Text('Lorem Ipsum DOlor Sit Amet Vsgah Khkh Hiii dnnnfkj', style: blackFontStyle3.copyWith(color: Colors.black))),
              Container(margin: EdgeInsets.only(bottom: 2), child: Text('07:12', style: blackFontStyle3.copyWith(color: greyColor))),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        leading: IconButton(
          icon: Icon(MdiIcons.chevronLeft, color: Colors.black, size: 40),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Container(
          width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 50,
          child: Row(children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(image: NetworkImage('https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=753'), fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Alex Rocher', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600)),
                Container(
                    width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 50 - 80,
                    child: Text(
                      'Truck Driver',
                      style: blackFontStyle3.copyWith(color: greyColor, fontSize: 12),
                      overflow: TextOverflow.clip,
                    )),
              ],
            ),
          ]),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Scrollbar(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    listView1(context),
                    const SizedBox(height: 80),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 245, 245, 245),
                      spreadRadius: 12.0,
                      blurRadius: 12.0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: "Tulis Pesan...", hintStyle: TextStyle(color: Colors.black54), border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
