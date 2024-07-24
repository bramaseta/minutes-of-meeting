part of "../pages.dart";

class AuthForgotPassword extends StatelessWidget {
  AuthForgotPassword({Key? key}) : super(key: key);

  final _controllerPage = Get.put(AuthForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.canPop(context) ? Navigator.pop(context) : Get.offAll(() => SignInPage());
        return true;
      },
      child: GetBuilder<AuthForgotPasswordController>(
        builder: (_) {
          return Scaffold(
            backgroundColor: "#ccc".toColor(),
            body: Stack(
              children: [
                Column(
                  children: const [
                    SizedBox(height: 40),
                    Center(child: Logo()),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 30, bottom: 30),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(border: Border.all(color: greyColor), borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: greyColor,
                                ),
                              )),
                          const SizedBox(height: 20),

                          // title
                          Text(
                            PRO(context).selectedCategory == "English" 
                            ? "Forgot your password ?"
                            : (PRO(context).selectedCategory == "Chinese"
                                ? "忘记密码？"
                                : "Lupa Password ?"),
                            style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          // description
                          const SizedBox(height: 5),
                          Text(
                            PRO(context).selectedCategory == "English" 
                            ? "Don't worry and keep calm"
                            : (PRO(context).selectedCategory == "Chinese"
                                ? "别着急，放心吧"
                                : "Jangan khawatir dan tetap tenang"),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: greyColor),
                          ),
                          // image ilust
                          const SizedBox(height: 20),
                          CustomTextField(placeHolder: 
                          PRO(context).selectedCategory == "English" 
                          ? "Input your email"
                          : (PRO(context).selectedCategory == "Chinese"
                              ? "输入您的邮箱"
                              : "Masukkan email anda"),
                           keyboardType: TextInputType.emailAddress, controllerField: _controllerPage.emailField),
                          const SizedBox(height: 10),

                          Text(
                            PRO(context).selectedCategory == "English" 
                            ? "*Enter your registered email" 
                            : (PRO(context).selectedCategory == "Chinese"
                                ? "*输入已注册的邮箱"
                                : "*Masukkan email yang telah anda daftarkan"),
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w900),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 20),

                          // BUTTON
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () => _controllerPage.submit(context),
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(const Size(145, 52)),
                                  backgroundColor: MaterialStateProperty.all(mainColor),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  PRO(context).selectedCategory == "English" 
                                  ? "Send" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "发送"
                                      : "Kirim"),
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                                )),
                          ),
                          const SizedBox(height: 10),
                          if (_controllerPage.showStatusSend == true)
                            Center(
                              child: Text(
                                PRO(context).selectedCategory == "English" 
                                ? "Please check your email" 
                                : (PRO(context).selectedCategory == "Chinese"
                                    ? "请检查您的邮件"
                                    : "Silahkan cek email anda"),
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: greyColor, fontWeight: FontWeight.w900),
                              ),
                            ),
                          const SizedBox(height: 30),
                          Center(
                            child: Text(
                              PRO(context).selectedCategory == "English" 
                              ? "Sign In" 
                              : (PRO(context).selectedCategory == "Chinese"
                                  ? "登录"
                                  : "Sign In"),
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: greyColor, fontWeight: FontWeight.w900),
                            ),
                          ),
                          const SizedBox(height: 10),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () => Navigator.canPop(context) ? Navigator.pop(context) : () {},
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(const Size(145, 52)),
                                  backgroundColor: MaterialStateProperty.all(Colors.black),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  PRO(context).selectedCategory == "English" 
                                  ? "Log In" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "登录"
                                      : "Masuk"),
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _controllerPage.loadingWidget == true ? const LoadingWidget() : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}