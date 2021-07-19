import 'dart:developer';

import 'package:adtspb/components/Loader.dart';
import 'package:adtspb/providers/ChildScreenProvider.dart';
import 'package:adtspb/screens/child/components/child_list/child_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ChildList extends StatelessWidget {
  Size size;

  ChildList(this.size);

  Widget build(BuildContext context) {
    return Consumer<ChildScreenProvider>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.children,
          builder: (context, snapshot) {
            dynamic childList = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                padding: EdgeInsets.only(
                  left: this.size.width * 0.04,
                  right: this.size.width * 0.04,
                ),
                children: this.buildChildrenList(childList, value),
              );
            } else {
              return Loader(Colors.black);
            }
          },
        );
      },
    );
  }

  List<ChildCard> buildChildrenList(
      dynamic childList, ChildScreenProvider value) {
    List<ChildCard> list = [];

    int i = 0;
    childList.forEach((element) {
      element['clearData'] = element;
      element['dataOnEdit'] = {
        'main': {
          "id": element["id"],
        },
        'extra': {
          "id": element["id"],
        },
      };
      element['_index'] = i;
      element['_provider'] = value;
      list.add(ChildCard(element, this.size));
      i++;
    });

    return list;
  }
}
