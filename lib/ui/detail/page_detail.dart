import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instamemories/ui/widget/network_image_widget.dart';
import 'package:instamemories/util/random_string_utils.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () => _popPage(context)),
        title: Text('Detail'),
        actions: null,
      ),
      body: DetailBody(),
    );
  }

  _popPage(BuildContext context) {
    Navigator.pop(context);
  }
}

class DetailBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailBodyState();
  }
}

class DetailBodyState extends State<DetailBody> {
  final RandomStringUtils randomStringUtils = RandomStringUtils();

  List<String> imageUrlList = [
    'https://www.rallyplus.net/wp-content/uploads/2019/10/thum_WRX-STI-EJ20-Final-Edition-prototype2.jpg',
    'https://clicccar.com/wp-content/uploads/2019/01/TOYOTA_Supra_01-20190127190831-900x507.jpg',
    'https://www.rallyplus.net/wp-content/uploads/2019/10/thum_WRX-STI-EJ20-Final-Edition-prototype2.jpg',
    'https://clicccar.com/wp-content/uploads/2019/01/TOYOTA_Supra_01-20190127190831-900x507.jpg',
  ];

  List<String> tagList = [
    'TOKYO',
    'LONDON',
    'TOYOTA',
    'NISSAN',
    'HONDA',
    'SUBARU',
    'MITSUBISHI',
    'DAIHATSU',
    'SUZUKI',
    'MAZDA',
  ];

  String title = "Title";

  String description = "This is a description.";

  List<String> commentList = List();

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 100; i++) {
      commentList.add(randomStringUtils.generate(43));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: _ImagePagerWidget(screenWidth, imageUrlList),
      ),
      SliverToBoxAdapter(
        child: Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0),
            )),
      ),
      SliverToBoxAdapter(
        child: Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24.0),
            )),
      ),
      SliverToBoxAdapter(
        child: _HorizontalScrollListWidget(screenWidth / 3, imageUrlList),
      ),
      SliverToBoxAdapter(
        child: _HashTagContainerWidget(tagList),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              title: Text(commentList[index]),
              leading: Icon(Icons.person),
            ),
          );
        },
        childCount: commentList.length,
      )),
    ]);
  }
}

class _ImagePagerWidget extends StatelessWidget {
  final double width;

  final List<String> imageUrlList;

  _ImagePagerWidget(this.width, this.imageUrlList);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: width,
        child: PageView(
            onPageChanged: null,
            children: imageUrlList
                .map<Widget>((imageUrl) => NetworkImageWidget(imageUrl))
                .toList()));
  }
}

class _HorizontalScrollListWidget extends StatelessWidget {
  final double height;
  final List<String> imageUrlList;

  _HorizontalScrollListWidget(this.height, this.imageUrlList);

  @override
  Widget build(BuildContext context) {
    final actualLength = imageUrlList.length + 2;
    final horizontalSpace = 8.0;
    final verticalSpace = 8.0;

    return Container(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actualLength,
        itemBuilder: (buildContext, index) {
          if (index == 0) {
            return Container(width: horizontalSpace, height: 0);
          } else if (index == actualLength - 1) {
            return Container(width: horizontalSpace, height: 0);
          } else {
            final actualIndex = (index - 1) < 0 ? 0 : (index - 1);

            return Container(
                margin: EdgeInsets.symmetric(
                    horizontal: horizontalSpace, vertical: verticalSpace),
                width: height - (horizontalSpace * 2),
                height: height - (verticalSpace * 2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrlList[actualIndex]))));
          }
        },
      ),
    );
  }
}

class _HashTagContainerWidget extends StatelessWidget {
  final List<String> tagList;

  _HashTagContainerWidget(this.tagList);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16.0),
        child: Wrap(
            children: tagList
                .map<Widget>((tagItem) => _TagWidget(tagItem))
                .toList()));
  }
}

class _TagWidget extends StatelessWidget {
  final String tag;

  _TagWidget(this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
        child: Text(
          "#" + tag,
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}
