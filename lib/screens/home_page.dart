import 'package:exchange/baseview/vase_view.dart';
import 'package:exchange/core/constants/color_const.dart';
import 'package:exchange/core/constants/size_const.dart';
import 'package:exchange/core/extension/context_extension.dart';
import 'package:exchange/model/currency_model.dart';
import 'package:exchange/service/service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(viewModel: HomePage(), OnPageBuilder: (context, widget){
      return CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: context.he * 0.4,
          pinned: true,
          flexibleSpace: Container(
            color: ColorConst.kScaffoldColor,
            height: context.he * 0.45,
            width: context.he,
            child: Stack(
              children: [
                Positioned(
                  top: context.he * 0.048,
                  left: context.he * 0.024,
                  right: context.he * 0.024,
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: SizeConst.large,
                      decoration: TextDecoration.none,
                      color: ColorConst.blacktextColor,
                    ),
                  ),
                ),
                Positioned(
                  left: context.he * 0.024,
                  right: context.he * 0.024,
                  top: context.he * 0.150,
                  child: Image.asset(
                    'assets/images/home.png',
                  ),
                ),
                Positioned(
                  top: context.he * 0.23,
                  left: context.he * 0.1,
                  right: context.he * 0.1,
                  child: Text(
                    'Welcome to Best Currency App',
                    style: TextStyle(
                      fontSize: SizeConst.medium,
                      color: ColorConst.whitetextColor,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: context.he * 0.07,
                  child: Image.asset(
                    'assets/images/circle.png',
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: ColorConst.kScaffoldColor,
            height: context.he,
            width: context.he,
            child: FutureBuilder(
              future: ApiService.getData(),
              builder: (context, AsyncSnapshot<List<CurrencyModel>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('NO internet'),
                  );
                } else {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Text(
                            snapshot.data![index].code.toString(),
                          ),
                          title: Text(
                            snapshot.data![index].title.toString(),
                          ),
                          trailing: Container(
                            height: context.he * 0.1,
                            width: context.he * 0.15,
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Buy'),
                                    Text(
                                      snapshot.data![index].nbuBuyPrice
                                          .toString(),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Sell'),
                                    Text(
                                      snapshot.data![index].nbuCellPrice == null
                                          ? '0'
                                          : snapshot.data![index].nbuCellPrice
                                              .toString(),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.length,
                  );
                }
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: context.he * 0.01,
            color: Colors.transparent,
          ),
        )
      ],
    );
    },
    );
  }
}
