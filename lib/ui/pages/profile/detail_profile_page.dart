part of '../pages.dart';

class DetailProfilePage extends StatelessWidget {
  DetailProfilePage({super.key});
  final _controllerPage = Get.put(AuthUserData());

  Widget backButton(String titlePage, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: mainColor,
      height: 80,
      child: Row(
        children: [
          InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )),
          const SizedBox(width: 20),
          Text(
            titlePage,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget listView1(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Name" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "姓名"
                        : "Nama"),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.name}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Division" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "部门"
                        : "Divisi"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.personGroup}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Employee ID" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "工号"
                        : "ID Employee"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employeeId}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Email" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "邮箱"
                        : "Email"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.email}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Phone Number" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "手机号码"
                        : "Nomor Telepon"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.phone}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Gender" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "性别"
                        : "Jenis Kelamin"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employee?.gender}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Start of Contract" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "合同开始日期"
                        : "Awal Kontrak"),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employee?.start}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "End of Contract" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "合同结束日期"
                        : "Akhir Kontrak"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employee?.end}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text('NIK', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employee?.detailemployee?.nik}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Employee Status" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "员工状况"
                        : "Status Employee"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employee?.detailemployee?.status}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Position" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "岗位"
                        : "Jabatan"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employee?.detailemployee?.jabatan}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Contract" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "合同"
                        : "Kontrak"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child:
                    Text('${PRO(context).userData?.employee?.detailemployee?.kontrak} Tahun', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Number of Family Members" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "家庭成员人数"
                        : "Jumlah Anggota Keluarga"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child:
                    Text('${PRO(context).userData?.employee?.detailemployee?.jmlKeluarga}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Address" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "地址"
                        : "Alamat"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employee?.detailemployee?.alamat}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "City" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "市"
                        : "Kota"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employee?.detailemployee?.kota}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Province" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "省"
                        : "Provinsi"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employee?.detailemployee?.provinsi}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Date of Birth" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "出生日"
                        : "Tanggal Lahir"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employee?.detailemployee?.tglLahir}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Blood Type" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "血性"
                        : "Golongan Darah"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employee?.detailemployee?.golDarah}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Current Address" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "现在地址"
                        : "Alamat Sekarang"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employee?.detailemployee?.currentAds}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
              const SizedBox(height: 10),
              Text(
                PRO(context).selectedCategory == "English" 
                    ? "Religion" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "宗教"
                        : "Agama"),
                 style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text('${PRO(context).userData?.employee?.detailemployee?.agama}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith()),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 
      PRO(context).selectedCategory == "English" 
                    ? "Profile Details" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "我的信息"
                        : "Detail Profil"),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: mainColor,
          title:  Text(
            PRO(context).selectedCategory == "English" 
                    ? "Profile Details" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "我的信息"
                        : "Detail Profil"),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        body: GetBuilder<AuthUserData>(initState: (state) async {
          await _controllerPage.initPage(context);
        }, builder: (_) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  listView1(context),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
