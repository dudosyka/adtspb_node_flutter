import 'package:adtspb/constants.dart';
import 'package:adtspb/screens/child/components/child_list/child_list.dart';
import 'package:adtspb/screens/child/components/child_screen_header.dart';
import 'package:flutter/material.dart';

class ChildScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPadding,
      ),
      child: ChildList(size),
    );
  }
}
