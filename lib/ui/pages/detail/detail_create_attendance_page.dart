part of "../pages.dart";

class DetailCreateAttendancePage extends StatelessWidget {
  final String resultScanQR;
  final String timeDateTakeQRCode;
  DetailCreateAttendancePage({super.key, required this.resultScanQR, required this.timeDateTakeQRCode});

  final _controllerPage = Get.put(DCAController());

  Widget backButton(String titlePage, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      height: 60,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () => Get.offAll(() => MainPage()),
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
            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget listView1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text('Nama :', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.black)),
                child: TextField(
                  controller: _controllerPage.nameController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text('Employee ID :', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.black)),
                child: TextField(
                  controller: _controllerPage.empleyoIDController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text('Division :', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.black)),
                child: TextField(
                  controller: _controllerPage.divisionController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text('Shift :', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.black)),
                child: DropdownButton<ShiftData>(
                  value: _controllerPage.selectedShift,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: _controllerPage.shiftsData
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.name ?? '',
                            style: blackFontStyle3,
                          )))
                      .toList(),
                  onChanged: (item) {
                    _controllerPage.handleSelectedShift(item!);
                  },
                ),
              ),
              const SizedBox(height: 15),
              Text('Status :', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
              // Container(
              //   width: double.infinity,
              //   margin: const EdgeInsets.only(top: 10),
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.black)),
              //   child: DropdownButton<String>(
              //     value: _controllerPage.selectedStatus,
              //     isExpanded: true,
              //     underline: const SizedBox(),
              //     items: _controllerPage.statusOption
              //         .map((e) => DropdownMenuItem(
              //             value: e,
              //             child: Text(
              //               e,
              //               style: blackFontStyle3,
              //             )))
              //         .toList(),
              //     onChanged: (item) {
              //       _controllerPage.handleSelectedStatus(item!);
              //     },
              //   ),
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: 45,
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () => _controllerPage.handleButtonStatus('Check In'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(_controllerPage.selectedStatus == 'Check In' ? "#5667FD".toColor() : Colors.grey),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ))),
                      child: Text('Check In', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: 45,
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () => _controllerPage.handleButtonStatus('Check Out'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(_controllerPage.selectedStatus == 'Check Out' ? "#5667FD".toColor() : Colors.grey),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ))),
                      child: Text('Check Out', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 24),
                height: 45,
                child: ElevatedButton(
                  onPressed: () async => await _controllerPage.submit(context),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ))),
                  child: Text('Kirim', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => MainPage());
        return true;
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
            leading: IconButton(
              icon: Icon(MdiIcons.chevronLeft, color: Colors.black, size: 40),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
            title: const Text('Attendance Scan', style: TextStyle(color: Colors.black)),
          ),
          body: GetBuilder<DCAController>(
            initState: (state) async {
              await _controllerPage.initPage(context, resultScanQR, timeDateTakeQRCode);
            },
            builder: (_) {
              return Stack(
                children: [
                  RefreshIndicator(
                    onRefresh: () async {
                      await _controllerPage.initPage(context, resultScanQR, timeDateTakeQRCode);
                    },
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            listView1(context),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
