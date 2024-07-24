part of '../pages.dart';

class ReportPage extends StatelessWidget {
  ReportPage({Key? key}) : super(key: key);
  final _controllerPage = Get.put(ReportController());

  Widget listView1(BuildContext context, String title) {
    return Container(
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: mainColor),
      ),
    );
  }

  Widget backButton(String titlePage, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: mainColor,
      height: 60,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              // onTap: () => Navigator.canPop(context) ? Navigator.pop(context) : Get.offAll(() => const AuthOption()),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 14,
                ),
              )),
          const SizedBox(width: 10),
          Text(
            titlePage,
            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget selectedDateWidget(BuildContext context) {
    return InkWell(
      onTap: _controllerPage.handleShowModal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: defaultMargin),
        child: GetBuilder<ReportController>(
          builder: (_) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        DateFormat('MMMM').format(_controllerPage.selectedDate ?? DateTime.now()),
                        style: blackFontStyle3.copyWith(),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        DateFormat('y').format(_controllerPage.selectedDate ?? DateTime.now()),
                        style: blackFontStyle3.copyWith(),
                      ),
                    ],
                  ),
                  Icon(Icons.calendar_month)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget modalSelectDate(BuildContext context) {
    return GetBuilder<ReportController>(
      builder: (_) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.black.withOpacity(0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)],
                ),
                child: SfDateRangePicker(
                  view: _controllerPage.selectMode,
                  // onSelectionChanged: _controllerPage.handleSelectDate,
                  onViewChanged: (val) async => _controllerPage.handleSelectDate(val, context),
                  todayHighlightColor: Colors.grey,
                  headerStyle: DateRangePickerHeaderStyle(
                    textStyle: blackFontStyle1.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  yearCellStyle: DateRangePickerYearCellStyle(
                    textStyle: blackFontStyle2,
                  ),
                  headerHeight: 50,
                  initialDisplayDate: _controllerPage.selectedDate,
                  initialSelectedDate: _controllerPage.selectedDate,
                  showNavigationArrow: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget listAbsen(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
        child: GetBuilder<ReportController>(
          initState: (state) async {
            await _controllerPage.initPage(context);
          },
          builder: (_) {
            return ListView.builder(
              itemCount: _controllerPage.hikData.length,
              itemBuilder: (BuildContext context, index) {
                return itemCardGaji(context, _controllerPage.hikData[index]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget itemCardGaji(BuildContext context, HikData item) {
    // DateTime time = DateFormat('H:m:s').parse('${item.time}');
    // String formattedTime = DateFormat('H:mm').format(time);

    String timeString = '${item.time}';
    DateTime? time = null;
    if (timeString.length == 5) {
      time = DateFormat('H:m:s').parse('$timeString:00');
    } else if (timeString.length == 8) {
      time = DateFormat('H:m:s').parse('$timeString');
    }
    String formattedTime = DateFormat('H:mm').format(time!);

    String dateString = '${item.tgl}';
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd MMMM yyyy').format(date);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(spreadRadius: 1, blurRadius: 3, color: Color.fromARGB(31, 180, 180, 180))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   width:60,
          //   height:60,
          //   decoration: BoxDecoration(
          //     color: mainColor,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Center(
          //     child: Text(
          //       'AA', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
          //     ),
          //   ),
          // ),
          // SizedBox(width:10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Container(
                width: (MediaQuery.of(context).size.width - 40 - 60 - 10 - 20),
                child: Text(
                  '${item.name}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: blackFontStyle1.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
                width: (MediaQuery.of(context).size.width - 40 - 10 - 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(MdiIcons.calendarOutline, size: 15),
                        SizedBox(width: 2),
                        Text(
                          formattedDate,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: blackFontStyle3.copyWith(color: Colors.black),
                        ),
                        SizedBox(width: 10),
                        Icon(MdiIcons.clockOutline, size: 15),
                        SizedBox(width: 2),
                        Container(
                          child: Text(
                            formattedTime,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: blackFontStyle3.copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                          color: ('${item.status}' == 'Check In')
                              ? "#71dd37".toColor()
                              : ('${item.status}' == 'Check Out')
                                  ? "#ff3e1d".toColor()
                                  : ('${item.status}' == 'Break In' || '${item.status}' == 'Break Out')
                                      ? "#ffab00".toColor()
                                      : ('${item.status}' == 'Overtime In' || '${item.status}' == 'Overtime Out')
                                          ? "#007bff".toColor()
                                          : "#ccc".toColor(),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          '${item.status}',
                          style: blackFontStyle3.copyWith(color: Colors.white, fontSize: 12),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: bgGrey,
        title: listView1(context, 
        PRO(context).selectedCategory == "English" 
                                  ? "Attendance" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "考勤"
                                      : "Kehadiran"),),
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 66.0), //
        child: Tooltip(
          preferBelow: false,
          message: 
          PRO(context).selectedCategory == "English" 
                                  ? "Forgot to take attendance?" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "忘记打卡？"
                                      : "Lupa Absen?"),
          child: FloatingActionButton(
            backgroundColor: mainColor,
            onPressed: () {
              // Get.to(() => OptionForgetattendance());
            },
            child: Icon(MdiIcons.headQuestion),
          ),
        ),
      ),
      body: GetBuilder<ReportController>(initState: (state) async {
        await _controllerPage.initPage(context);
      }, builder: (_) {
        print(_controllerPage.hikData.length.toString());
        return Stack(
          children: [
            Column(
              children: [
                selectedDateWidget(context),
                _controllerPage.hikData.isNotEmpty
                    ? listAbsen(context)
                    : Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                width: 200,
                                child: const Image(
                                  image: AssetImage('assets/nf.gif'),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 50),
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
                                      ? "Your attendance recap was not found"
                                      : (PRO(context).selectedCategory == "Chinese"
                                          ? "您的上班统计未找到"
                                          : "Rekap kehadiran anda tidak ditemukan"),
                                      style: blackFontStyle1.copyWith(color: greyColor, fontSize: 13),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                const SizedBox(height: 80),
              ],
            ),
            _controllerPage.showModal == true ? modalSelectDate(context) : Container(),
          ],
        );
      }),
    );
  }
}
