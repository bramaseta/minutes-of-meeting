part of "../pages.dart";

class CreateReportPage extends StatefulWidget {
  const CreateReportPage({super.key});

  @override
  State<CreateReportPage> createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage> {
  File ? ktp;
  TextEditingController lokasiController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  List<String>? categories;
  String? selectedCategory;

  @override
  void initState() {
    super.initState();

    categories = ['Laporan Parkir', 'Laporan BBM', 'Laporan Tol', 'Laporan Kejadian'];
    selectedCategory = categories![0];
  }

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
              onTap: () => Navigator.canPop(context) ? Navigator.pop(context) : Get.offAll(() => MainPage()),
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
          width:double.infinity,
          padding:const EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bukti Foto :', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize:13),),
          ],)
        ),
        GestureDetector(
            onTap: () async {
              PickedFile? pickedFile =
                  await ImagePicker().getImage(source: ImageSource.camera);
              if (pickedFile != null) {
                ktp = File(pickedFile.path);
                setState(() {});
              }
            },
            child: Container(
              width: double.infinity,
              height:MediaQuery.of(context).size.height/3,
              padding: const EdgeInsets.all(defaultMargin),
              child: (ktp != null)
                  ? Container(
                      width: double.infinity,
                      height:MediaQuery.of(context).size.height/3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: FileImage(ktp!), fit: BoxFit.cover)),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: bgGrey,
                      ),
                      child: Icon(MdiIcons.camera, size:55, color: Color.fromARGB(255, 156, 156, 156)),
                    ),
            ),
          ),
        Container(
          width:double.infinity,
          padding:const EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, defaultMargin),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kategori :', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize:13),),
              Container(
                width: double.infinity,
                margin:const EdgeInsets.only(top:10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black)),
                child: DropdownButton(
                    value: selectedCategory,
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: categories?.map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: blackFontStyle3,
                            )))
                        .toList(),
                    onChanged: (item) {
                      setState(() {
                        selectedCategory = item;
                      });
                    }),
              ),
              SizedBox(height:15),
              Text('Deskripsi :', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize:13),),
              Container(
                width: double.infinity,
                margin:const EdgeInsets.only(top:10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black)),
                child: TextField(
                  controller: deskripsiController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,),
                ),
              ),
              SizedBox(height:15),
              Text('Lokasi :', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize:13),),
              Container(
                width: double.infinity,
                margin:const EdgeInsets.only(top:10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black)),
                child: TextField(
                  controller: lokasiController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 24),
                height: 45,
                child: ElevatedButton(
                        onPressed: () {Get.offAll(MainPage());},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )
                          )
                        ),
                        child: Text(
                          'Kirim',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
              ),
          ],)
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          leading: IconButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.black, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          title: const Text('Buat Laporan', style:TextStyle(color:Colors.black)),
        ),
        body: Stack(
              children: [
                ListView(
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
              ],
            )
      )
    );
  }
}