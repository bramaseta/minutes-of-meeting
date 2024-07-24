part of "../pages.dart";

class OptionKnowladge extends StatelessWidget {
  OptionKnowladge({Key? key}) : super(key: key);
  final _controllerPage = Get.put(OptionKnowladgeController());

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

  Widget listKnowladge(BuildContext context) {
  return GetBuilder<OptionKnowladgeController>(builder: (_) {
    return Container(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (1 / 1.4),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          //physics:BouncingScrollPhysics(),
          padding: EdgeInsets.all(10.0),
            children: _controllerPage.knowladgeData == null
              ? []
              : _controllerPage.knowladgeData!.isEmpty
                ? []
                : _controllerPage.knowladgeData!.map((element1) {
                    return itemKnowladge(element1, context);
                  }).toList(),
          ),
        ),
      ),
    );
  });
}



  Widget itemKnowladge(KnowladgeData item, BuildContext context) {
    DateTime itemTime = DateTime.fromMillisecondsSinceEpoch(item.updatedAt! * 1000);
    return GestureDetector(
      onTap: () {
              Get.to(DetailKnowladge(item:item));
            },
      child: Container(
              child: Column(
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width / 2),
                    height: (MediaQuery.of(context).size.width / 2),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(item.thumbnail.toString()),
                        fit: BoxFit.cover,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ),

                  SizedBox(height:10),
                  Container(
                    width:(MediaQuery.of(context).size.width/2),
                    child: Text(item.title!, style:blackFontStyle3.copyWith(fontSize:12),overflow: TextOverflow.ellipsis)),
                  Container(
                    width:(MediaQuery.of(context).size.width/2),
                    child: Center(
                      child: Text('${DateFormat('d').format(itemTime)} ${DateFormat('MMMM').format(itemTime)} ${DateFormat('y').format(itemTime)}', style:blackFontStyle3.copyWith(fontSize:11, color:Colors.grey, fontWeight: FontWeight.w600))),
                  )
                ],
              ),
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 
      PRO(context).selectedCategory == "English" 
      ? "Knowledge" 
      : (PRO(context).selectedCategory == "Chinese"
          ? "新闻"
          : "Berita"),
      home: RefreshIndicator(
        onRefresh: () async {
          await _controllerPage.initPage(context);
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: mainColor,
            title: Text(
              PRO(context).selectedCategory == "English" 
              ? "Knowledge" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "新闻"
                  : "Berita"),),
            systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          ),
          body: GetBuilder<OptionKnowladgeController>(
            initState: (state) async {
              await _controllerPage.initPage(context);
            },
            builder: (_) {
            return Stack(
              children: [
                _controllerPage.knowladgeData.isEmpty
                    ? Center(
                        child: Text(
                          PRO(context).selectedCategory == "English" 
                          ? "Empty knowledge data" 
                          : (PRO(context).selectedCategory == "Chinese"
                              ? "无消息"
                              : "Data berita kosong"), 
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                        ),
                      )
                    : ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              listKnowladge(context),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ],
                      ),
                _controllerPage.loadingWidget == true ? const LoadingWidget() : Container(),
              ],
            );
          },
          ),
        ),
      ),
    );
  }
}