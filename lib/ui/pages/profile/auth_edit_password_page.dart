part of "../pages.dart";

class AuthEditPassword extends StatelessWidget {
  AuthEditPassword({Key? key}) : super(key: key);

  final _controllerPage = Get.put(AuthEditPasswordController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.canPop(context) ? Navigator.pop(context) : Get.to(() => SignInPage());
        return true;
      },
      child: GetBuilder<AuthEditPasswordController>(builder: (_) {
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
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 30, bottom: 30),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.canPop(context) ? Navigator.pop(context) : Get.to(() => SignInPage());
                            },
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
                          ? "Edit Password" 
                          : (PRO(context).selectedCategory == "Chinese"
                              ? "更新密码"
                              : "Edit Password"),
                          style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        // description
                        const SizedBox(height: 5),
                        Text(
                          PRO(context).selectedCategory == "English" 
                          ? "Please edit your password" 
                          : (PRO(context).selectedCategory == "Chinese"
                              ? "请更新您的密码"
                              : "Silahkan edit password anda"),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: greyColor, fontWeight: FontWeight.w900),
                        ),
                        // image ilust
                        const SizedBox(height: 20),

                        CustomTextField(
                            placeHolder: 
                            PRO(context).selectedCategory == "English" 
                            ? "Current Password" 
                            : (PRO(context).selectedCategory == "Chinese"
                                ? "您目前的密码"
                                : "Password Saat Ini"),
                            controllerField: _controllerPage.oldPasswordField,
                            obscureText: _controllerPage.obsecureText,
                            customFunction1: _controllerPage.toggleObsecureText),

                        const SizedBox(height: 10),
                        CustomTextField(
                            placeHolder: 
                            PRO(context).selectedCategory == "English" 
                            ? "New Password" 
                            : (PRO(context).selectedCategory == "Chinese"
                                ? "新密码"
                                : "Password Baru"),
                            controllerField: _controllerPage.passwordField,
                            obscureText: _controllerPage.obsecureText,
                            customFunction1: _controllerPage.toggleObsecureText),

                        const SizedBox(height: 10),
                        CustomTextField(
                            placeHolder: 
                            PRO(context).selectedCategory == "English" 
                            ? "Repeat New Password" 
                            : (PRO(context).selectedCategory == "Chinese"
                                ? "重新输入新密码"
                                : "Ulangi Password Baru"),
                            controllerField: _controllerPage.confirmPasswordField,
                            obscureText: _controllerPage.obsecureText,
                            customFunction1: _controllerPage.toggleObsecureText),
                        const SizedBox(height: 20),
                        // BUTTON
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () async => await _controllerPage.submit(context),
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
                                ? "Save" 
                                : (PRO(context).selectedCategory == "Chinese"
                                    ? "保存"
                                    : "Simpan"),
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                              )),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {Navigator.canPop(context) ? Navigator.pop(context) : Get.to(() => SignInPage());},
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
                              ? "Cancel" 
                              : (PRO(context).selectedCategory == "Chinese"
                                  ? "取消"
                                  : "Batal"),
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }
}