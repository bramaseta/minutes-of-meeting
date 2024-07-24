part of '../pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  Widget listView1(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6?.copyWith(color: mainColor),
      ),
    );
  }

  Widget listView2(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 243, 243, 243),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          listView3(context),
          const SizedBox(height: 20),
          listView4(context),
          const SizedBox(height: 20),
          listView5(context),
        ],
      ),
    );
  }

  Widget listView3(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen();
              }));
            },
            child: Container(
              width: 70,
              height:70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                // color: "#ccc".toColor(),
                image: DecorationImage(
                  image: PRO(context).userData?.profilePhotoPath != null
                    ? NetworkImage('${PRO(context).userData?.profilePhotoUrl}')
                    : AssetImage(
                        PRO(context).userData?.employee?.gender == "Male"
                            ? 'assets/co.png'
                            : 'assets/ce.png',
                      ) as ImageProvider<Object>,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text('${PRO(context).userData?.name}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
                ),
                const SizedBox(height: 3),
                SizedBox(
                  width: double.infinity,
                  child: Text('${PRO(context).userData?.email}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: greyColor)),
                ),
              ],
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }

  Widget listView4(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PRO(context).selectedCategory == "English" 
                                  ? "Settings" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "设置"
                                      : "Pengaturan"),
             style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w900, color: greyColor)),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: ()  => Get.to(() => DetailProfilePage()),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    PRO(context).selectedCategory == "English" 
                    ? "Profile Details" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "我的信息"
                        : "Detail Profil"),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith()), Icon(Icons.arrow_forward_ios_rounded, size: 16)],
              ),
            ),
          ),
          GestureDetector(
            onTap: ()  => Get.to(() => AuthEditProfile()),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(
                  PRO(context).selectedCategory == "English" 
                  ? "Edit Account" 
                  : (PRO(context).selectedCategory == "Chinese"
                      ? "编辑账户"
                      : "Edit Akun"),
                   style: Theme.of(context).textTheme.bodyMedium?.copyWith()), Icon(Icons.arrow_forward_ios_rounded, size: 16)],
              ),
            ),
          ),
          GestureDetector(
            onTap: ()  => Get.to(() => AuthEditPassword()),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(
                  PRO(context).selectedCategory == "English" 
                  ? "Edit Password" 
                  : (PRO(context).selectedCategory == "Chinese"
                      ? "更新密码"
                      : "Edit Password"),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith()), Icon(Icons.arrow_forward_ios_rounded, size: 16)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listView5(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PRO(context).selectedCategory == "English" 
                                  ? "Help" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "帮助"
                                      : "Bantuan"),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w900, color: greyColor)),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Get.to(ProfileSyaratKetentuan());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(
                  PRO(context).selectedCategory == "English" 
                  ? "Terms and Conditions" 
                  : (PRO(context).selectedCategory == "Chinese"
                      ? "要求与规定"
                      : "Syarat dan Ketentuan"),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith()), Icon(Icons.arrow_forward_ios_rounded, size: 16)],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(ProfileKontakKami());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(
                  PRO(context).selectedCategory == "English" 
                  ? "Contact Us" 
                  : (PRO(context).selectedCategory == "Chinese"
                      ? "联系我们"
                      : "Kontak Kami"),
                   style: Theme.of(context).textTheme.bodyMedium?.copyWith()), Icon(Icons.arrow_forward_ios_rounded, size: 16)],
              ),
            ),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField(
            decoration: InputDecoration.collapsed(
              hintText: 'Pilih Bahasa',
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
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async => await PRO(context).clearAllData(context, true),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(145, 45)),
                  backgroundColor: MaterialStateProperty.all('#5D63D1'.toColor()),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                child: Text(
                  PRO(context).selectedCategory == "English" 
                                  ? "Sign Out" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "出去"
                                      : "Keluar"),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(height: 80, color: bgGrey),
                Expanded(child: Container(color: Colors.white)),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  listView1(
                    PRO(context).selectedCategory == "English" 
                                  ? "Account" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "账户"
                                      : "Akun"), ),
                  listView2(context),
                  const SizedBox(),
                ],
              ),
            ),
            // PRO(context).loadingWidget == true ? const LoadingWidget() : Container(),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            icon:
                Icon(MdiIcons.chevronLeft, color: Colors.black, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          title: Text('${PRO(context).userData?.name}',style:const TextStyle(color:Colors.black)),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: '${PRO(context).userData?.name}',
            child: Image(
              image: PRO(context).userData?.profilePhotoPath != null
                    ? NetworkImage('${PRO(context).userData?.profilePhotoUrl}')
                    : AssetImage(
                        PRO(context).userData?.employee?.gender == "Male"
                            ? 'assets/co.png'
                            : 'assets/ce.png',
                      ) as ImageProvider<Object>,
            ),
          ),
        ),
        onTap: () {
          // Navigator.pop(context);
        },
      ),
    );
  }
}