import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:online_shop_app_demo/features/number_trivia/data/data_sources/local_data/commen/constants.dart';
import '../widgets/app_bar.dart';
import '../widgets/dashboard_card.dart';
import 'item_detail_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  LocalStorage storage = LocalStorage('fav');

  @override
  void initState() {
    getStorageData();
    super.initState();
  }

  getStorageData() {
    setState(() {
      storage = LocalStorage('fav');
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 70) / 2.8;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: const WidgetAppBar(
          title: 'Brotchen',
          showLeading: false,
        ),
        body: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
          itemCount: Constants.dataList.length,
          itemBuilder: (context, index) {
            Map data = Constants.dataList[index];
            var name = data["name"].toString();
            var img = data["img"].toString();
            var price = data["price"].toString();
            var isFav = storage.getItem(data["name"].toString()) ?? false;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ItemDetailPage(name, img, price, isFav, () async {
                              if (isFav) {
                                await storage.deleteItem(name);
                              } else {
                                await storage.setItem(name, true);
                              }
                              setState(() {});
                            })));
              },
              child: DashboardCard(name, img, price, isFav, () async {
                if (isFav) {
                  await storage.deleteItem(name).whenComplete(() {
                    setState(() {
                      isFav = !isFav;
                    });
                  });
                } else {
                  await storage.setItem(name, true).then((value) {
                    setState(() {
                      isFav = !isFav;
                    });
                  });
                }
              }, "dashBoard"),
            );
          },
        ));
  }
}
