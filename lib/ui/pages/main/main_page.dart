part of '../pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;

  MainPage({this.initialPage = 0});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int selectedPage;
  PageController? pageController;

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controllerPage = Get.put(HomeController());
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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: '#D3D3D3'.toColor(),
          ),
          SafeArea(
            child: Container(
              color: '#F5F5F5'.toColor(),
            ),
          ),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                Center(
                  child: HomePage(),
                ),
                Center(
                  child: AnnualPage(),
                ),
                Center(
                  child: ReportPage(),
                ),
                Center(
                  child: ProfilePage(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavBar(
              selectedIndex: selectedPage,
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController?.jumpToPage(selectedPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
