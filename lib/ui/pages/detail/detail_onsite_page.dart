part of "../pages.dart";

class DetailOnsitePage extends StatefulWidget {
  final ForgetattendanceData item;
  DetailOnsitePage({required this.item});

  @override
  _DetailOnsitePageState createState() => _DetailOnsitePageState();
}

class _DetailOnsitePageState extends State<DetailOnsitePage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    String divisi = widget.item.division.toString();
    divisi = divisi.replaceAll('All Persons/', '');
    return MaterialApp(
      title: PRO(context).selectedCategory == "English" 
                    ? "Tag Location" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "位置标签"
                        : "Tag Lokasi"),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: mainColor,
          title: Text(PRO(context).selectedCategory == "English" 
                    ? "Tag Location" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "位置标签"
                        : "Tag Lokasi"),),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: widget.item.link,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (value) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:const EdgeInsets.symmetric(horizontal:defaultMargin, vertical:10),
                width:double.infinity,
                height:150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17),
                    topRight: Radius.circular(17),
                  ),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom:15),
                      width: (MediaQuery.of(context).size.width / 6),
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: "#e6e6e6".toColor(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.item.name.toString(),
                              style: blackFontStyle2.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                              overflow:TextOverflow.ellipsis,
                              maxLines:1,
                            ),
                          ),
                          SizedBox(height:3),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '$divisi • ${DateFormat('dd MMMM yyyy').format(DateTime.parse(widget.item.tgl!))}, ${widget.item.time}',
                              style: blackFontStyle3.copyWith(
                                fontSize:12,
                                color: "#b5b5b5".toColor()
                              ),
                            ),
                          ),
                          SizedBox(height:7),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: widget.item.status == 'Check In' 
                                  ? LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: ["#46d100".toColor(), Colors.yellow],
                                    )
                                  : const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Colors.red, Colors.orange],
                                    ),
                            ),
                            child: Text(
                              widget.item.status.toString(),
                              style: blackFontStyle3.copyWith(color: Colors.white),
                            ),
                          ),
                          // SizedBox(height:20),
                          // Container(
                          //   width: double.infinity,
                          //   height: 100,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(12),
                          //     color: Colors.white,
                          //     border: Border.all(color: "#d6d6d6".toColor()),
                          //     boxShadow: [
                          //       BoxShadow(
                          //         offset: Offset(0, 2),
                          //         spreadRadius: 0,
                          //         blurRadius: 6,
                          //         color: Color.fromRGBO(106, 106, 106, 0.2),
                          //       ),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
