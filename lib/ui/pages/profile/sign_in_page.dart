part of '../pages.dart';

class SignInPage extends StatelessWidget {
  // bool isLoading = false;
  final _controllerPage = Get.put(AuthSignInController());

  SignInPage({super.key});

  Widget formDataOvertime(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(children: [
          const SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            width: double.infinity,
            height: 80,
            child: Row(
              children: [
                Center(child: Container(
                  child: Image.asset('assets/logo.png',
                    width:  (MediaQuery.of(context).size.width /6),
                  fit: BoxFit.cover),
                ),)
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: 
            Text(
              PRO(context).selectedCategory == "English" 
              ? "Hello, Welcome Back" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "您好！欢迎光临！"
                  : "Halo, Selamat Datang"),
               style: blackFontStyle1.copyWith(fontSize: 20, fontWeight: FontWeight.w700)),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 6),
            child: Text(
              PRO(context).selectedCategory == "English" 
              ? "Happy to see you again, to use your account please login first."
              : (PRO(context).selectedCategory == "Chinese"
                  ? "很高兴再见到您，请先登录您的账户再使用"
                  : "Senang bertemu dengan Anda lagi, untuk menggunakan akun Anda, silakan masuk terlebih dahulu."),
              style: blackFontStyle2.copyWith(fontSize: 13),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: Row(
              children: [
                Icon(MdiIcons.translate, size:15, color: Colors.black),
                const SizedBox(width:5),
                Text(
                  PRO(context).selectedCategory == "English" 
                    ? "Choose Language" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "多语言"
                        :  "Pilih Bahasa"),
                   style: blackFontStyle2.copyWith(fontSize: 13, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                hintText: 'Choose Language',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(),
              ),
              icon: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.black),
              value: PRO(context).selectedCategory,
              items: PRO(context).category.map<DropdownMenuItem<String>>((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    PRO(context).changeLang(value);
                  },
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: Text(
              PRO(context).selectedCategory == "English" 
              ? "Email" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "邮箱"
                  : "Email"),
               style: blackFontStyle2.copyWith(fontSize: 13, fontWeight: FontWeight.w700)),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.black)),
            child: TextField(
              controller: _controllerPage.emailField,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              PRO(context).selectedCategory == "English" 
              ? "Password" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "密码"
                  : "Password"),
               style: blackFontStyle2.copyWith(fontSize: 13, fontWeight: FontWeight.w700)),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.black)),
            child: TextField(
              obscureText: _controllerPage.obsecureText,
              controller: _controllerPage.passwodField,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(_controllerPage.obsecureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: _controllerPage.toggleObsecureText,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      // fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: _controllerPage.checkTnC,
                      onChanged: (bool? value) => _controllerPage.handleTnc(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          PRO(context).selectedCategory == "English" 
                          ? "I understand and agree"
                          : (PRO(context).selectedCategory == "Chinese"
                              ? "我了解及同意"
                              : "Saya mengerti dan menyetujui "),
                          style: blackFontStyle1.copyWith(fontSize: 10),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => ProfileSyaratKetentuan()),
                          child: Text(
                            PRO(context).selectedCategory == "English" 
                            ? "Terms and Conditions" 
                            : (PRO(context).selectedCategory == "Chinese"
                                ? "要求与规定"
                                : "Syarat dan Ketentuan"),
                            style: blackFontStyle1.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 14),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ElevatedButton(
              onPressed: () async => await _controllerPage.submit(context),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                PRO(context).selectedCategory == "English" 
              ? "Login" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "登录"
                  : "Masuk"),
                style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(() => AuthForgotPassword()),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
              child: Text(
                PRO(context).selectedCategory == "English" 
              ? "Forgot Password"
              : (PRO(context).selectedCategory == "Chinese"
                  ? "忘记密码"
                  : "Lupa Password"),
                textAlign: TextAlign.center,
                style: blackFontStyle2.copyWith(fontSize: 13, color: mainColor),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      title: 
      PRO(context).selectedCategory == "English" 
              ? "Sign In" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "Sign In"
                  : "Sign In"),
      home: RefreshIndicator(
        onRefresh: () async {
          await _controllerPage.initPage(context);
        },
        child: Scaffold(
          body: GetBuilder<AuthSignInController>(
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
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 180,
                                left: 0,
                                right: 0,
                                child: Column(
                                  children: [
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
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(7),
                                              ),
                                            ),
                                          ),
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                });
              }
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      formDataOvertime(context),
                      Column(
                        children: [
                          Center(
                            child: Text("App Version: ${_controllerPage.appVersion}", style: blackFontStyle2.copyWith(fontSize: 10)),
                          ),
                          Center(
                            child: Text("© 2023 PT. Wellsun Plastic Technology Indonesia", style: blackFontStyle2.copyWith(fontSize: 10)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
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
