part of '../pages.dart';

class DetailKnowladge extends StatefulWidget {
  final KnowladgeData item;
  DetailKnowladge({Key? key, required this.item}) : super(key: key);

  @override
  _DetailKnowladgeState createState() => _DetailKnowladgeState();
}

class _DetailKnowladgeState extends State<DetailKnowladge> {
  late double _scale;
  late double _previousScale;
  late Offset _offset;

  @override
  void initState() {
    super.initState();
    _scale = 1.0;
    _previousScale = 1.0;
    _offset = Offset.zero;
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _previousScale = _scale;
  }

  void _handleScaleUpdate(ScaleUpdateDetails details) {
  setState(() {
    _scale = _previousScale * details.scale;
    final scaledFocalPoint = details.focalPoint * details.scale;
    _offset = Offset(details.focalPoint.dx - scaledFocalPoint.dx, details.focalPoint.dy - scaledFocalPoint.dy);
  });
}


  void _handleScaleEnd(ScaleEndDetails details) {
    _previousScale = 1.0;
  }

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
            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget listContent1(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(
          children: [
            ClipRRect(
              child:  Image.network(
                widget.item.thumbnail!,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal:10),
              child: Column(children: [
                Text(
                  '${widget.item.title}',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 10),
                HTML_VIEW('${widget.item.description}'),
              ],)
            ),
            const SizedBox(height: 20),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(8.0),
            //   child:  Image.network(
            //           item.picture!,
            //           width: double.infinity,
            //           fit: BoxFit.fill,
            //         ),
            // ),
            GestureDetector(
              onScaleStart: _handleScaleStart,
              onScaleUpdate: _handleScaleUpdate,
              onScaleEnd: _handleScaleEnd,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(_offset.dx, _offset.dy)
                    ..scale(_scale),
                  child: Image.network(
                    '${widget.item.picture}',
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (widget.item.urlVideo != null)
              YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: '${widget.item.urlVideo}',
                flags: YoutubePlayerFlags(
                  mute: false,
                  autoPlay: false,
                ),
              ),
              showVideoProgressIndicator: true,
              onReady: () {
                print('Player is ready.');
              },
              progressIndicatorColor: Colors.amber,
            ),
            const SizedBox(height: defaultMargin),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: PRO(context).selectedCategory == "English" 
                    ? "Knowledge Details" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "消息详细"
                        : "Detail Berita"),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: mainColor,
          title: Text(
            PRO(context).selectedCategory == "English" 
                    ? "Knowledge Details" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "消息详细"
                        : "Detail Berita"),),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            listContent1(context),
            if (widget.item.link != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    String? stringWebsite = widget.item.link;
                    Uri urlWebsite = Uri.parse(stringWebsite!);
                    try {
                      await launchUrl(urlWebsite, mode: LaunchMode.externalApplication);
                    } catch (e) {
                      snackBars(message: 'Could not open Web');
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                    backgroundColor: MaterialStateProperty.all(mainColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: Text(
                    "Link",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  } 
}