part of '../pages.dart';

class AnnualPage extends StatelessWidget {
  Widget listView1(BuildContext context, String title) {
    return Container(
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: mainColor),
      ),
    );
  }

  final _controllerPage = Get.put(AnnualController());

  Widget tabOvertime(BuildContext context) {
    return GetBuilder<AnnualController>(builder: (_) {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 50),
        padding: const EdgeInsets.symmetric(vertical: defaultMargin, horizontal: 15),
        child: _controllerPage.empovertimeData.isNotEmpty
            ? ListView.builder(
                itemCount: _controllerPage.empovertimeData.length,
                itemBuilder: (context, index) {
                  return itemOvertime(context, _controllerPage.empovertimeData[index]);
                },
              )
            : Container(
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
                              ? "Your overtime recap was not found"
                              : (PRO(context).selectedCategory == "Chinese"
                                  ? "您的加班统计未找到"
                                  : "Rekap lembur anda tidak ditemukan"),
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
      );
    });
  }

  Widget itemOvertime(BuildContext context, EmpovertimeData item) {
    Color greenColor = "#71dd37".toColor(); // Confirm
    Color blueColor = const Color.fromARGB(255, 114, 147, 255); // Pending
    Color redColor = Colors.red; // Ditolak

    return GestureDetector(
      onTap: () => Get.to(() => DetailOvertimePage(item: item)),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, border: Border.all(color: mainColor, width: 1)),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 80,
                child: Row(children: [
                  Container(
                    width: 20,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(formatDateDDMMMMYY(item.date), style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 5),
                      SizedBox(
                          width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 80 - 80,
                          child: Row(
                            children: [
                              Icon(MdiIcons.clock, size: 14, color: greyColor),
                              Text(
                                '${item.timeMasuk ?? '-- : --'} - ${item.timePulang ?? '-- : --'}',
                                style: blackFontStyle3.copyWith(color: greyColor, fontSize: 12),
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          )),
                    ],
                  )
                ]),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: item.status == "Pending"
                        ? blueColor
                        : item.status == "Ditolak"
                            ? redColor
                            : greenColor,
                  ),
                  child: Text(item.status == "Ditolak" ? "Rejected" : '${item.status}' ?? '-', style: blackFontStyle3.copyWith(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white)))
            ],
          )),
    );
  }

  Widget tabPermission(BuildContext context) {
    return GetBuilder<AnnualController>(builder: (_) {
      return Container(
        margin: const EdgeInsets.only(bottom: 50),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: defaultMargin, horizontal: 15),
        child: _controllerPage.permissionData.isNotEmpty
            ? ListView.builder(
                itemCount: _controllerPage.permissionData.length,
                itemBuilder: (context, index) {
                  return itemPermission(context, _controllerPage.permissionData[index]);
                },
              )
            : Container(
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
                                  ? "Your paid leave recap was not found"
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "您的请加统计未找到"
                                      : "Rekap izin anda tidak ditemukan"),
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
      );
    });
  }

  Widget tabInventoryrequest(BuildContext context) {
    return GetBuilder<AnnualController>(builder: (_) {
      return Container(
        margin: const EdgeInsets.only(bottom: 50),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: defaultMargin, horizontal: 15),
        child: _controllerPage.inventoryrequestData.isNotEmpty
            ? ListView.builder(
                itemCount: _controllerPage.inventoryrequestData.length,
                itemBuilder: (context, index) {
                  return itemInventoryrequest(context, _controllerPage.inventoryrequestData[index]);
                },
              )
            : Container(
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
                                  ? "Your inventory loan recap was not found"
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "您的库存贷款概要未找到"
                                      : "Rekap peminjaman inventaris anda tidak ditemukan"),
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
      );
    });
  }

  Widget tabForgetattendance(BuildContext context) {
    return GetBuilder<AnnualController>(builder: (_) {
      return Container(
        margin: const EdgeInsets.only(bottom: 50),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: defaultMargin, horizontal: 15),
        child: _controllerPage.forgetattendanceData.isNotEmpty
            ? ListView.builder(
                itemCount: _controllerPage.forgetattendanceData.length,
                itemBuilder: (context, index) {
                  return itemForgetattendance(context, _controllerPage.forgetattendanceData[index]);
                },
              )
            : Container(
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
                                  ? "Your attendance submission recap was not found"
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "您的申请加班未找到"
                                      : "Rekap pengajuan kehadiran anda tidak ditemukan"),
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
      );
    });
  }

  Widget itemPermission(BuildContext context, PermissionData item) {
    Color greenColor = "#71dd37".toColor(); // Confirm
    Color blueColor = const Color.fromARGB(255, 114, 147, 255); // Pending
    Color redColor = Colors.red; // Ditolak

    return GestureDetector(
      onTap: () => Get.to(() => DetailReportPage(item: item)),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, border: Border.all(color: mainColor, width: 1)),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 80,
                child: Row(children: [
                  Container(
                    width: 20,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.category ?? '-', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 5),
                      SizedBox(
                          width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 80 - 80,
                          child: Row(
                            children: [
                              Icon(MdiIcons.calendar, size: 14, color: greyColor),
                              Text(
                                formatDateDDMMMMYY(item.date),
                                style: blackFontStyle3.copyWith(color: greyColor, fontSize: 12),
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          )),
                    ],
                  )
                ]),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: item.status == "Pending"
                        ? blueColor
                        : item.status == "Ditolak"
                            ? redColor
                            : greenColor,
                  ),
                  child: Text(item.status == "Ditolak" ? "Rejected" : '${item.status}' ?? '-', style: blackFontStyle3.copyWith(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white)))
            ],
          )),
    );
  }

  Widget itemInventoryrequest(BuildContext context, InventoryrequestData item) {
    Color greenColor = "#71dd37".toColor(); // Confirm
    Color blueColor = const Color.fromARGB(255, 114, 147, 255); // Pending
    Color redColor = Colors.red; // Ditolak

    return GestureDetector(
      onTap: () {},
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, border: Border.all(color: mainColor, width: 1)),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 80,
                child: Row(children: [
                  Container(
                    width: 20,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.inventory?.name ?? '-', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 5),
                      SizedBox(
                          width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 80 - 50,
                          child: Row(
                            children: [
                              Icon(MdiIcons.calendar, size: 14, color: greyColor),
                              Text(
                                formatDateDDMMMMYY(item.tglPinjam),
                                style: blackFontStyle3.copyWith(color: greyColor, fontSize: 12),
                                overflow: TextOverflow.clip,
                              ),
                              SizedBox(width: 5),
                              Icon(MdiIcons.clockOutline, size: 14, color: greyColor),
                              Text(
                                item.time.toString(),
                                style: blackFontStyle3.copyWith(color: greyColor, fontSize: 12),
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          )),
                    ],
                  )
                ]),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: item.status == "Pending"
                        ? blueColor
                        : item.status == "Ditolak"
                            ? redColor
                            : greenColor,
                  ),
                  child: Text(item.status == "Ditolak" ? "Rejected" : '${item.status}' ?? '-', style: blackFontStyle3.copyWith(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white)))
            ],
          )),
    );
  }

  Widget itemForgetattendance(BuildContext context, ForgetattendanceData item) {
    Color greenColor = "#71dd37".toColor(); // Confirm
    Color blueColor = const Color.fromARGB(255, 114, 147, 255); // Pending
    Color redColor = Colors.red; // Ditolak

    return GestureDetector(
      onTap: () => Get.to(() => DetailOnsitePage(item: item)),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, border: Border.all(color: mainColor, width: 1)),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 80,
                child: Row(children: [
                  Container(
                    width: 20,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.status ?? '-', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 5),
                      SizedBox(
                          width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 80 - 50,
                          child: Row(
                            children: [
                              Icon(MdiIcons.calendar, size: 14, color: greyColor),
                              Text(
                                formatDateDDMMMMYY(item.tgl),
                                style: blackFontStyle3.copyWith(color: greyColor, fontSize: 12),
                                overflow: TextOverflow.clip,
                              ),
                              SizedBox(width: 5),
                              Icon(MdiIcons.clockOutline, size: 14, color: greyColor),
                              Text(
                                item.time.toString(),
                                style: blackFontStyle3.copyWith(color: greyColor, fontSize: 12),
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          )),
                    ],
                  )
                ]),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: item.confirm == "Pending"
                        ? blueColor
                        : item.confirm == "Ditolak"
                            ? redColor
                            : greenColor,
                  ),
                  child: Text(item.confirm == 'Sudah' ? 'Confirm' : item.confirm == 'Ditolak' ? 'Rejected' : '${item.confirm}' ?? '-', style: blackFontStyle3.copyWith(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white)))
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          toolbarHeight: 80,
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            indicatorColor: Colors.white.withOpacity(0.0),
            tabs: [
              Tab(
                  icon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: mainColor,
                      ),
                      child: Text(
                        PRO(context).selectedCategory == "English" 
                                  ? "Overtime" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "加班"
                                      : "Lembur"),
                      ))),
              Tab(
                  icon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: mainColor,
                      ),
                      child: Text(
                        PRO(context).selectedCategory == "English" 
                                  ? "Paid Leave"
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "申请休假"
                                      : "Pengajuan Cuti"),
                      ))),
              Tab(
                  icon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: mainColor,
                      ),
                      child: Text(
                        PRO(context).selectedCategory == "English" 
                                  ? "Inventory Loan"
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "库存借贷"
                                      : "Peminjaman Inventaris"),
                      ))),
              Tab(
                  icon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: mainColor,
                      ),
                      child: Text(
                        PRO(context).selectedCategory == "English" 
                                  ? "Attendance Submission"
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "申请上班"
                                      : "Pengajuan Kehadiran"),
                      ))),
            ],
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          backgroundColor: bgGrey,
          title: listView1(context, 
          PRO(context).selectedCategory == "English" 
                                  ? "Approval"
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "审批"
                                      : "Approval"),
          ),
        ),
        body: GetBuilder<AnnualController>(
            initState: (state) async => await _controllerPage.initPage(context),
            builder: (_) {
              return TabBarView(
                children: [
                  tabOvertime(context),
                  tabPermission(context),
                  tabInventoryrequest(context),
                  tabForgetattendance(context),
                ],
              );
            }),
      ),
    );
  }
}
