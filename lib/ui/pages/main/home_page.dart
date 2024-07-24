part of '../pages.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _controllerPage = Get.put(HomeController());

  Widget containerIcon(Function() handleClick, String titleIcon) {
    return SizedBox(
      height: 90,
      width: 85,
      child: GestureDetector(
        onTap: handleClick,
        child: Column(
          children: [
            Icon(MdiIcons.abacus, size: 45),
            const SizedBox(height: 10),
            Flexible(
                child: Text(titleIcon,
                    maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: blackFontStyle3.copyWith(fontSize: 11, color: Color.fromARGB(255, 211, 211, 211))))
          ],
        ),
      ),
    );
  }

  Widget listMeeting(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: _controllerPage.meetingDataAll == null
                ? []
                : _controllerPage.meetingDataAll!.isEmpty
                    ? []
                    : _controllerPage.meetingDataAll!.map((element1) {
                        return itemMeeting(element1, context);
                      }).toList(),
          ),
        ),
      );
    });
  }

  Widget listNotification(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      if (_controllerPage.notificationData == null || _controllerPage.notificationData!.isEmpty) {
        return Container();
      } else {
        NotificationData notification = _controllerPage.notificationData!.first;
        return Container(child: itemNotification(notification, context));
      }
    });
  }

  Widget itemNotification(NotificationData item, BuildContext context) {
    return Text("${item.title}", overflow: TextOverflow.ellipsis, maxLines: 2, style: blackFontStyle3.copyWith(fontSize: 12));
  }

  Widget itemMeeting(MeetingData item, BuildContext context) {
    DateTime dateTime = DateFormat('H:mm:s').parse('${item.time}');
    String formattedTime = DateFormat('H:mm').format(dateTime);
    String dateString = '${item.date}';
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd MMMM yyyy').format(date);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                  width: 80,
                  child: Center(
                    child: Text(formattedTime, style: blackFontStyle1.copyWith(fontSize: 30)),
                  )),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        //                   <--- left side
                        color: Colors.blue,
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('${item.name}', style: blackFontStyle2.copyWith(fontSize: 15, fontWeight: FontWeight.w700)),
                    Container(
                        width: MediaQuery.of(context).size.width - (2 * defaultMargin) - 20 - 20 - 80 - 5,
                        child: Text(
                          '${item.detail}', style: blackFontStyle1.copyWith(fontSize: 12),
                          //  overflow: TextOverflow.ellipsis,
                          //  maxLines:1
                        )),
                    Text(formattedDate, style: blackFontStyle2.copyWith(fontSize: 12, fontWeight: FontWeight.w700, color: greyColor)),
                  ]))
            ],
          )),
    );
  }

  Widget itemKnowladge(BuildContext context, KnowladgeData item) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Container(
          // margin: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () {
              Get.to(DetailKnowladge(item: item));
            },
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: "#ccc".toColor(),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: item.thumbnail == null
                                ? Image.asset(
                                    'assets/bg_tiket.png',
                                    height: 160,
                                    width: 230,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    item.thumbnail!,
                                    height: 160,
                                    width: 230,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget listMasuk(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      if (_controllerPage.masukData == null || _controllerPage.masukData!.isEmpty) {
        return Container();
      } else {
        HikData masuk = _controllerPage.masukData!.first;
        return Container(child: itemMasuk(masuk, context));
      }
    });
  }
  
  Widget itemMasuk(HikData item, BuildContext context) {
    String originalTime = "${item.time}";
    List<String> timeParts = originalTime.split(":");
    String shortenedTime = "${timeParts[0]}:${timeParts[1]}"; // Ambil jam dan menit saja
    return Text(shortenedTime, style: blackFontStyle3.copyWith(color:Colors.white, fontSize:12, fontWeight: FontWeight.w700));
  }
  
  Widget listPulang(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      if (_controllerPage.pulangData == null || _controllerPage.pulangData!.isEmpty) {
        return Container();
      } else {
        HikData pulang = _controllerPage.pulangData!.first;
        return Container(child: itemPulang(pulang, context));
      }
    });
  }
  
  Widget itemPulang(HikData item, BuildContext context) {
    String originalTime = "${item.time}";
    List<String> timeParts = originalTime.split(":");
    String shortenedTime = "${timeParts[0]}:${timeParts[1]}"; // Ambil jam dan menit saja
    return Text(shortenedTime, style: blackFontStyle3.copyWith(color:Colors.white, fontSize:12, fontWeight: FontWeight.w700));
  }
  
  Widget listTelat(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      if (_controllerPage.masukData == null || _controllerPage.masukData!.isEmpty) {
        return Container();
      } else {
        HikData masuk = _controllerPage.masukData!.first;
        return Container(child: itemTelat(masuk, context));
      }
    });
  }
  
  Widget itemTelat(HikData item, BuildContext context) {
    String originalTime = "${item.time}";
    List<String> timeParts = originalTime.split(":");
    int itemHour = int.parse(timeParts[0]);
    int itemMinute = int.parse(timeParts[1]);

    // Get the current date and time
    DateTime now = DateTime.now();

    // Create a DateTime object for itemTime based on the current date
    DateTime itemTime = DateTime(now.year, now.month, now.day, itemHour, itemMinute);

    // Get the startTime from PRO(context)
    String startTimeStr = PRO(context).userData?.employee?.shift?.startTime ?? '';
    List<String> startTimeParts = startTimeStr.split(":");
    int startTimeHour = int.parse(startTimeParts[0]);
    int startTimeMinute = int.parse(startTimeParts[1]);

    // Create a DateTime object for startTime based on the current date
    DateTime startTime = DateTime(now.year, now.month, now.day, startTimeHour, startTimeMinute);

    // Compare itemTime with startTime
    bool isLate = itemTime.isAfter(startTime);

  return isLate
      ? Container(
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage('assets/bgr.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: (MediaQuery.of(context).size.width - (defaultMargin * 2) - (10 * 2)) / 1.7,
                child: Text(
                  PRO(context).selectedCategory == "English"
                      ? "Sorry, you're late today"
                      : (PRO(context).selectedCategory == "Chinese"
                          ? "对不起，今天您迟到"
                          : "Anda terlambat hari ini"),
                  style: blackFontStyle1.copyWith(fontSize: 19, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width - (defaultMargin * 2) - (10 * 2)) / 2.8,
                padding: const EdgeInsets.all(10),
                child: Image(
                  image: AssetImage('assets/sad.gif'),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        )
      : Container(
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage('assets/bgh.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: (MediaQuery.of(context).size.width - (defaultMargin * 2) - (10 * 2)) / 2,
                child: Text(
                  PRO(context).selectedCategory == "English"
                      ? "Have a good day"
                      : (PRO(context).selectedCategory == "Chinese"
                          ? "祝您今天愉快"
                          : "Selamat Beraktifitas"),
                  style: blackFontStyle1.copyWith(fontSize: 19, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width - (defaultMargin * 2) - (10 * 2)) / 2,
                padding: const EdgeInsets.all(10),
                child: Image(
                  image: AssetImage('assets/work.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
  }
  
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('E, dd MMM yyyy').format(now);
    String startTime = PRO(context).userData?.employee?.shift?.startTime ?? '';
    String shortenedTime = startTime.substring(0, 5); // Mengambil karakter dari indeks 0 hingga 4
    return RefreshIndicator(
      onRefresh: () async {
        await _controllerPage.initPage(context);
      },
      child: Scaffold(
        backgroundColor: "#eee".toColor(),
        body: GetBuilder<HomeController>(
          initState: (state) async {
            await _controllerPage.initPage(context);
          },
          builder: (_) {
            if (_controllerPage.maintenanceData?.status == "ACTIVE") {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                showDialog(
                  context: context,
                  barrierDismissible: false, // Mencegah dialog dari ditutup ketika pengguna menyentuh area lain
                  builder: (BuildContext context) {
                    return WillPopScope(
                        // Mencegah dialog ditutup ketika pengguna menekan tombol back
                        onWillPop: () async => false,
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.zero,
                          content: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                      child: Container(
                                    margin: const EdgeInsets.only(bottom: 140),
                                    width: 200,
                                    child: const Image(
                                      image: AssetImage('assets/mtc.gif'),
                                    ),
                                  )),
                                ],
                              ),
                              Positioned(
                                  top: 180,
                                  left: 0,
                                  right: 0,
                                  child: Column(children: [
                                    Container(
                                      child: Text(
                                        '${_controllerPage.maintenanceData?.title}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                      child: Text(
                                        '${_controllerPage.maintenanceData?.description}',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            SystemNavigator.pop();
                                          },
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(7),
                                              ))),
                                          child: Text(
                                            PRO(context).selectedCategory == "English" 
                                            ? "Close" 
                                            : (PRO(context).selectedCategory == "Chinese"
                                                ? "关闭应用程序"
                                                : "Tutup Aplikasi"),
                                            style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]))
                            ],
                          ),
                        ));
                  },
                );
              });
            }
            return ListView(
              children: [
                Column(
                  children: [
                    //// HEADER
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(defaultMargin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      PRO(context).selectedCategory == "English" 
                                      ? "Welcome Back" 
                                      : (PRO(context).selectedCategory == "Chinese"
                                          ? "欢迎光临"
                                          : "Selamat Datang"),
                                      style: blackFontStyle1.copyWith(color: "#1E48B2".toColor(), fontWeight: FontWeight.w600, fontSize: 22)),
                                    Container(
                                        width: MediaQuery.of(context).size.width - (2 * defaultMargin) - 80,
                                        child: Text('${PRO(context).userData?.name}',
                                            style: blackFontStyle1.copyWith(color: "#636D77".toColor(), fontSize: 18), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                  ],
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(OptionNotification());
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        // color: "#ccc".toColor(),
                                        image: DecorationImage(
                                          image: PRO(context).userData?.profilePhotoPath != null
                                              ? NetworkImage('${PRO(context).userData?.profilePhotoUrl}')
                                              : AssetImage(
                                                  PRO(context).userData?.employee?.gender == "Male" ? 'assets/co.png' : 'assets/ce.png',
                                                ) as ImageProvider<Object>,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: CircleAvatar(
                                          backgroundColor: ui.Color.fromARGB(255, 70, 23, 173),
                                          radius: 12.0,
                                          child: Icon(
                                            MdiIcons.bell,
                                            size: 15.0,
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )),
                    //// NOTIF
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                mainColor,
                                "#5667FD".toColor(),
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height:15),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width:double.infinity,child: Text(formattedDate, style: blackFontStyle3.copyWith(color:Colors.white, fontSize:15),textAlign: TextAlign.end)),
                              const SizedBox(height:6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                        Row(
                                          children:[
                                            Icon(MdiIcons.login, color: Colors.white, size:15),
                                            Text(PRO(context).selectedCategory == "English" 
                                                            ? " In : " 
                                                            : (PRO(context).selectedCategory == "Chinese"
                                                                ? " 上班时间 : "
                                                                : " In : "), style: blackFontStyle3.copyWith(color:Colors.white, fontSize:12)),
                                            _controllerPage.masukData.isEmpty
                                            ? Text('- : -', style: blackFontStyle3.copyWith(color:Colors.white, fontSize:12, fontWeight: FontWeight.w700))
                                            : listMasuk(context),
                                          ]
                                        ),
                                        Row(
                                          children:[
                                            Icon(MdiIcons.logout, color: Colors.white, size:15),
                                            Text(PRO(context).selectedCategory == "English" 
                                                            ? " Out : " 
                                                            : (PRO(context).selectedCategory == "Chinese"
                                                                ? " 下班时间 : "
                                                                : " Out : "),style: blackFontStyle3.copyWith(color:Colors.white, fontSize:12)),
                                            _controllerPage.pulangData.isEmpty
                                            ? Text('- : -', style: blackFontStyle3.copyWith(color:Colors.white, fontSize:12, fontWeight: FontWeight.w700))
                                            : listPulang(context),
                                          ]
                                        ),
                                      ]
                                    )
                                  ),
                                  const SizedBox(width:10),
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children:[
                                        TimeDisplay(),
                                        Row(
                                          children:[
                                            Text(PRO(context).selectedCategory == "English" 
                                                            ? "*Check in before ${shortenedTime}" 
                                                            : (PRO(context).selectedCategory == "Chinese"
                                                                ? "*打卡${shortenedTime}之前"
                                                                : "*Check in sebelum ${shortenedTime}"), style: blackFontStyle3.copyWith(color:Colors.white, fontSize:10,  fontStyle: FontStyle.italic,)),
                                          ]
                                        )
                                      ]
                                    )
                                  ),
                                  // Container(
                                  //     width: 60,
                                  //     height: 60,
                                  //     decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(50),
                                  //       color: Colors.white,
                                  //     ),
                                  //     child: Center(
                                  //       child: Icon(MdiIcons.bell, size: 30, color: mainColor),
                                  //     )),
                                  // SizedBox(width: 10),
                                  // Container(
                                  //   width: MediaQuery.of(context).size.width - (4 * defaultMargin) - 60 - 10,
                                  //   padding: EdgeInsets.all(10),
                                  //   height: 60,
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(12),
                                  //     color: Colors.white,
                                  //   ),
                                  //   child: Center(
                                  //     child: _controllerPage.notificationData.isEmpty
                                  //         ? Center(
                                  //             child: Text(
                                  //               PRO(context).selectedCategory == "English" 
                                  //               ? "There's no notification today" 
                                  //               : (PRO(context).selectedCategory == "Chinese"
                                  //                   ? "今天没有更新的消息"
                                  //                   : "Tidak ada notifikasi hari ini"),
                                  //                 overflow: TextOverflow.ellipsis,
                                  //                 maxLines: 2,
                                  //                 style: blackFontStyle3.copyWith(
                                  //                   color: greyColor,
                                  //                   fontSize: 12,
                                  //                   fontStyle: FontStyle.italic,
                                  //                 )))
                                  //         : listNotification(context),
                                  //   ),
                                  // )
                                ],
                              ),
                              const SizedBox(height:15),
                              _controllerPage.masukData.isEmpty
                              // ? CircularProgressIndicator(
                              //     color: Colors.white,
                              //     strokeWidth: 4.0,
                              //   )
                              ? Container(
                                height: 90,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage('assets/bgy.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: (MediaQuery.of(context).size.width - (defaultMargin * 2) - (10 * 2)) / 2,
                                      child: Text(
                                        PRO(context).selectedCategory == "English"
                                            ? "You haven't checked in yet"
                                            : (PRO(context).selectedCategory == "Chinese"
                                                ? "你还没有登记"
                                                : "Anda belum check in"),
                                        style: blackFontStyle1.copyWith(fontSize: 19, fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      width: (MediaQuery.of(context).size.width - (defaultMargin * 2) - (10 * 2)) / 2,
                                      padding: const EdgeInsets.all(10),
                                      child: Image(
                                        image: AssetImage('assets/run.gif'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              : listTelat(context),
                            ],
                          )),
                    ),
                    
                    //// MENU
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text("Menu", style: blackFontStyle2.copyWith(fontWeight: FontWeight.w700)),
                        GestureDetector(
                            onTap: () {
                              Get.bottomSheet(Container(
                                height: Get.height / 2.8,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: defaultMargin * 6, right: defaultMargin * 6, top: 15),
                                        child: Container(width: 100, height: 7, decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: mainColor))),
                                    Container(
                                        padding: const EdgeInsets.all(defaultMargin),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                // SizedBox(
                                                //   height: 90,
                                                //   width: 85,
                                                //   child: GestureDetector(
                                                //     onTap: (){ Get.to(() => const OptionQRScanPage());},
                                                //     child: Column(
                                                //       children: [
                                                //         Icon(MdiIcons.radar, size: 45),
                                                //         const SizedBox(height: 10),
                                                //         Flexible(child: Text('Attendance', maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: blackFontStyle3.copyWith(fontSize: 11, color: Color.fromARGB(255, 211, 211, 211))))
                                                //       ],
                                                //     ),
                                                //   ),
                                                // ),
                                                SizedBox(
                                                  height: 90,
                                                  width: 85,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.to(() => OptionCalendar());
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Icon(MdiIcons.calendar, size: 45),
                                                        const SizedBox(height: 10),
                                                        Flexible(
                                                            child: Text(
                                                            PRO(context).selectedCategory == "English" 
                                                            ? "Calendar" 
                                                            : (PRO(context).selectedCategory == "Chinese"
                                                                ? "日历"
                                                                : "Kalender"),
                                                            maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: blackFontStyle3.copyWith(fontSize: 10)))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 90,
                                                  width: 85,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.to(() => OptionInventory());
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Icon(MdiIcons.car, size: 45),
                                                        const SizedBox(height: 10),
                                                        Flexible(
                                                            child: Text(
                                                              PRO(context).selectedCategory == "English" 
                                                              ? "Inventory" 
                                                              : (PRO(context).selectedCategory == "Chinese"
                                                                  ? "库存"
                                                                  : "Inventaris"),
                                                                maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: blackFontStyle3.copyWith(fontSize: 10)))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 90,
                                                  width: 85,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.to(() => OptionMeeting());
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Icon(MdiIcons.calendarBadgeOutline, size: 45),
                                                        const SizedBox(height: 10),
                                                        Flexible(
                                                            child: Text(
                                                              PRO(context).selectedCategory == "English" 
                                                              ? "Meeting Schedule" 
                                                              : (PRO(context).selectedCategory == "Chinese"
                                                                  ? "会议日程"
                                                                  : "Agenda Meeting"),
                                                                maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: blackFontStyle3.copyWith(fontSize: 10)))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 15),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 90,
                                                  width: 85,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.to(OptionKnowladge());
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Icon(MdiIcons.pencilRuler, size: 45),
                                                        const SizedBox(height: 10),
                                                        Flexible(
                                                            child: Text(
                                                             PRO(context).selectedCategory == "English" 
                                                              ? "Knowledge" 
                                                              : (PRO(context).selectedCategory == "Chinese"
                                                                  ? "新闻"
                                                                  : "Berita"),
                                                                maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: blackFontStyle3.copyWith(fontSize: 10)))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(width: (MediaQuery.of(context).size.width - (2 * 85) - (2 * defaultMargin)) / 3),
                                                // SizedBox(
                                                //   height: 90,
                                                //   width: 85,
                                                //   child: GestureDetector(
                                                //     onTap: () {
                                                //       Get.to(OptionReimbursement());
                                                //     },
                                                //     child: Column(
                                                //       children: [
                                                //         Icon(MdiIcons.logout, size: 45),
                                                //         const SizedBox(height: 10),
                                                //         Flexible(
                                                //             child: Text('Reimbursement',
                                                //                 maxLines: 2,
                                                //                 textAlign: TextAlign.center,
                                                //                 overflow: TextOverflow.ellipsis,
                                                //                 style: blackFontStyle3.copyWith(fontSize: 10)))
                                                //       ],
                                                //     ),
                                                //   ),
                                                // ),
                                                SizedBox(
                                                  height: 90,
                                                  width: 85,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.to(OptionWhistleblowing());
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                          MdiIcons.headset,
                                                          size: 45,
                                                        ),
                                                        const SizedBox(height: 10),
                                                        Flexible(
                                                            child: Text(
                                                              PRO(context).selectedCategory == "English" 
                                                              ? "Whistleblowing" 
                                                              : (PRO(context).selectedCategory == "Chinese"
                                                                  ? "举报"
                                                                  : "Whistleblowing"),
                                                                maxLines: 2,
                                                                textAlign: TextAlign.center,
                                                                overflow: TextOverflow.ellipsis,
                                                                style: blackFontStyle3.copyWith(
                                                                  fontSize: 10,
                                                                )))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ));
                            },
                            child: Text(
                              PRO(context).selectedCategory == "English" 
                                  ? "Show All" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "全部显示"
                                      : "Lihat Semua"),
                              style: blackFontStyle2.copyWith(color: mainColor, fontSize: 12)))
                      ]),
                    ),
                    Container(
                        padding: const EdgeInsets.all(defaultMargin),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // SizedBox(
                                //   height: 90,
                                //   width: 85,
                                //   child: GestureDetector(
                                //     onTap: (){ Get.to(() => const OptionQRScanPage());},
                                //     child: Column(
                                //       children: [
                                //         Icon(MdiIcons.radar, size: 45),
                                //         const SizedBox(height: 10),
                                //         Flexible(child: Text('Attendance', maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: blackFontStyle3.copyWith(fontSize: 10, color: Color.fromARGB(255, 211, 211, 211))))
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                Container(
                                  height: 100,
                                  width: 70,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => OptionPayroll());
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: "#ddd3f5".toColor(),
                                            ),
                                            child: Icon(MdiIcons.scriptText, size: 45, color : ui.Color.fromARGB(255, 46, 0, 162))),
                                        const SizedBox(height: 10),
                                        Flexible(
                                            child: Text(
                                              PRO(context).selectedCategory == "English" 
                                              ? "Payroll" 
                                              : (PRO(context).selectedCategory == "Chinese"
                                                  ? "工资"
                                                  : "Gaji"),
                                                maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: blackFontStyle3.copyWith(fontSize: 10, fontWeight: FontWeight.w600)))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  width: 70,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => OptionOvertime());
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color:"#ddd3f5".toColor(),
                                            ),
                                            child: Icon(MdiIcons.timerPlus, size: 45, color : ui.Color.fromARGB(255, 46, 0, 162))),
                                        const SizedBox(height: 10),
                                        Flexible(
                                            child: Text(
                                              PRO(context).selectedCategory == "English" 
                                              ? "Overtime" 
                                              : (PRO(context).selectedCategory == "Chinese"
                                                  ? "加班"
                                                  : "Lembur"),
                                                maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: blackFontStyle3.copyWith(fontSize: 10, fontWeight: FontWeight.w600)))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  width: 70,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => OptionLeave());
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color:"#ddd3f5".toColor(),
                                            ),
                                            child: Icon(MdiIcons.listBox, size: 45, color : ui.Color.fromARGB(255, 46, 0, 162))),
                                        const SizedBox(height: 10),
                                        Flexible(
                                            child: Text(
                                              PRO(context).selectedCategory == "English" 
                                              ? "Paid Leave" 
                                              : (PRO(context).selectedCategory == "Chinese"
                                                  ? "休假"
                                                  : "Cuti"),
                                                maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: blackFontStyle3.copyWith(fontSize: 10, fontWeight: FontWeight.w600)))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  width: 70,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => OptionWarnletter());
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color:"#ddd3f5".toColor(),
                                            ),
                                            child: Icon(MdiIcons.fireAlert, size: 45, color : ui.Color.fromARGB(255, 46, 0, 162))),
                                        const SizedBox(height: 10),
                                        Flexible(
                                            child: Text(
                                              PRO(context).selectedCategory == "English" 
                                              ? "Warning Letter" 
                                              : (PRO(context).selectedCategory == "Chinese"
                                                  ? "警告信"
                                                  : "Surat Peringatan"),
                                                maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: blackFontStyle3.copyWith(fontSize: 10, fontWeight: FontWeight.w600)))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      height: 12,
                      color: "#e3e3e3".toColor(),
                    ),
                    //// Slide Pertama
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(
                          PRO(context).selectedCategory == "English" 
                                  ? "Knowledge" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "新闻"
                                      : "Berita"),
                           style: blackFontStyle2.copyWith(fontWeight: FontWeight.w700)),
                        GestureDetector(
                            onTap: () {
                              Get.to(OptionKnowladge());
                            },
                            child: Text(
                              PRO(context).selectedCategory == "English" 
                                  ? "Show All" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "全部显示"
                                      : "Lihat Semua"),
                              style: blackFontStyle2.copyWith(color: mainColor, fontSize: 12)))
                      ]),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Container(
                            width: (MediaQuery.of(context).size.width / 1.7),
                            child: Text(
                              PRO(context).selectedCategory == "English" 
                                  ? "News and general knowledge that employees must know" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "员工必须了解的各种新闻和常识"
                                      : "Ragam berita dan pengetahuan umum yang wajib karyawan tahu"),
                              style: blackFontStyle2.copyWith(color: "#878787".toColor(), fontSize: 12))),
                      ]),
                    ),
                    SizedBox(height: defaultMargin),
                    Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: _controllerPage.knowladgeData!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          final item = _controllerPage.knowladgeData![index];
                          final leftPadding = index == 0 ? defaultMargin : 0.0;
                          return Padding(
                            padding: EdgeInsets.only(left: leftPadding),
                            child: itemKnowladge(context, item),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: double.infinity,
                      height: 12,
                      color: "#e3e3e3".toColor(),
                    ),
                    //// Slide Kedua
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(
                          PRO(context).selectedCategory == "English" 
                                  ? "Agenda" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "日程"
                                      : "Agenda"),
                          style: blackFontStyle2.copyWith(fontWeight: FontWeight.w700)),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => OptionMeeting());
                            },
                            child: Text(
                              PRO(context).selectedCategory == "English" 
                                  ? "Show All" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "全部显示"
                                      : "Lihat Semua"),
                               style: blackFontStyle2.copyWith(color: mainColor, fontSize: 12)))
                      ]),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Container(
                            width: (MediaQuery.of(context).size.width / 1.7),
                            child: Text(
                              PRO(context).selectedCategory == "English" 
                                  ? "Don't miss out on your meeting today" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "别错过今天的议程"
                                      : "Jangan lewatkan agenda meeting anda hari ini"),
                            style: blackFontStyle2.copyWith(color: "#878787".toColor(), fontSize: 12))),
                      ]),
                    ),
                    SizedBox(height: 10),
                    GetBuilder<HomeController>(
                      initState: (state) async {
                        await _controllerPage.initPage(context);
                      },
                      builder: (_) {
                        return Container(
                          child: _controllerPage.meetingDataAll.isEmpty
                              ? Center(
                                  child: Column(
                                    children: [
                                      Center(
                                          child: Container(
                                        margin: const EdgeInsets.only(bottom: 20),
                                        width: 200,
                                        child: const Image(
                                          image: AssetImage('assets/nf.gif'),
                                        ),
                                      )),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 50,
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              PRO(context).selectedCategory == "English" 
                                              ? "Oops!\nData not found"
                                              : (PRO(context).selectedCategory == "Chinese"
                                                  ? "哦！\n未找到数据"
                                                  : "Oops!\nData tidak ditemukan"),
                                              style: blackFontStyle1.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              PRO(context).selectedCategory == "English" 
                                              ? "You don't have any meetings scheduled today" 
                                              : (PRO(context).selectedCategory == "Chinese"
                                                  ? "您今天没有会议安排"
                                                  : "Anda tidak memiliki jadwal meeting hari ini"),
                                              style: blackFontStyle1.copyWith(
                                                color: greyColor,
                                                fontSize: 13,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : listMeeting(context),
                        );
                      },
                    ),

                    SizedBox(
                      height: 80,
                    )
                  ],
                )
              ],
            );
          },
          // builder: (_) {
          //   return ListView(
          //     children: [
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: <Widget>[
          //           const SizedBox(height: 10),
          //           listMeeting(context),
          //           const SizedBox(height: 30),
          //         ],
          //       ),
          //     ],
          //   );
          // },
        ),
      ),
    );
  }
}

class TimeDisplay extends StatefulWidget {
  @override
  _TimeDisplayState createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  late Stream<String> _timeStream;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timeStream = Stream.periodic(Duration(seconds: 1), (_) {
      _currentTime = DateTime.now();
      return DateFormat('HH:mm:ss').format(_currentTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: _timeStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
            style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w700),
          );
        } else {
          return Text(
            '--:--:--',
            style: TextStyle(fontSize: 24, color: Colors.white),
          );
        }
      },
    );
  }
}