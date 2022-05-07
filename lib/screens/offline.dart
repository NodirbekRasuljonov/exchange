import 'package:exchange/core/extension/context_extension.dart';
import 'package:exchange/service/service.dart';
import 'package:flutter/material.dart';

class OffLinePage extends StatelessWidget {
  const OffLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var snapshot = ApiService.mybox!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Offline'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(
                snapshot.getAt(index)!.code.toString(),
              ),
              title: Text(
                snapshot.getAt(index)!.title.toString(),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Buy'),
                        Text(
                          snapshot.getAt(index)!.nbuBuyPrice.toString(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Sell'),
                        Text(
                          snapshot.getAt(index)!.nbuCellPrice == null
                              ? '0'
                              : snapshot.getAt(index)!.nbuCellPrice.toString(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: snapshot.length,
      ),
    );
  }
}
