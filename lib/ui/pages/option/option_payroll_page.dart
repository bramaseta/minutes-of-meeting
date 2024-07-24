part of '../pages.dart';

class OptionPayroll extends StatelessWidget {
  OptionPayroll({Key? key}) : super(key: key);
  final _controllerPage = Get.put(OptionPayrollController());

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
        child: GetBuilder<OptionPayrollController>(
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
                  boxShadow: const [
                    BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)
                  ],
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

  Widget listGaji(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
        child: GetBuilder<OptionPayrollController>(
          initState: (state) async {
            await _controllerPage.initPage(context);
          },
          builder: (_) {
            return ListView.builder(
              itemCount: _controllerPage.payrollData.length,
              itemBuilder: (BuildContext context, index) {
                return itemCardGaji(context, _controllerPage.payrollData[index]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget itemCardGaji(BuildContext context, PayrollData item) {
    return GestureDetector(
      onTap: () => Get.to(() => DetailPayroll(item: item)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: "#e6e6e6".toColor(),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), topLeft: Radius.circular(15), bottomRight: Radius.circular(0), topRight: Radius.circular(0)),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    "#ff7700".toColor(),
                    "#fcba03".toColor(),
                  ],
                ),
              ),
              child: Center(
                child: Text(DateFormat('MMMM').format(DateTime.parse(item.date.toString().split(' ')[0] ?? '${DateTime.now()}')), style: blackFontStyle1.copyWith(color: Colors.white)),
              ),
            ),
            const SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: "#111".toColor(),
                  ),
                  child: Text(formatDateDDMMMMYY(item.date.toString().split(' ')[0]), style: blackFontStyle3.copyWith(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700))),
              SizedBox(
                  width: MediaQuery.of(context).size.width - (2 * defaultMargin) - 100 - 24 - 10,
                  child: Text("Total : ${item.grandTotal}", style: blackFontStyle2.copyWith(fontSize: 15), overflow: TextOverflow.ellipsis))
            ])
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 
      PRO(context).selectedCategory == "English" 
      ? "Payroll Slip" 
      : (PRO(context).selectedCategory == "Chinese"
          ? "工资条"
          : "Slip Gaji"),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: mainColor,
          title: Text(
            PRO(context).selectedCategory == "English" 
            ? "Payroll Slip" 
            : (PRO(context).selectedCategory == "Chinese"
                ? "工资条"
                : "Slip Gaji"),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        body: GetBuilder<OptionPayrollController>(initState: (state) async {
          await _controllerPage.initPage(context);
        }, builder: (_) {
          print(_controllerPage.payrollData.length.toString());
          return Stack(
            children: [
              Column(
                children: [
                  selectedDateWidget(context),
                  _controllerPage.payrollData.isNotEmpty
                    ? listGaji(context)
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
                                      ? 'Your payroll slip was not found'
                                      : (PRO(context).selectedCategory == "Chinese"
                                          ? "您的工资条未找到"
                                          : 'Slip gaji anda tidak ditemukan'),
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
                ],
              ),
              _controllerPage.showModal == true ? modalSelectDate(context) : Container(),
            ],
          );
        }),
      ),
    );
  }
}
