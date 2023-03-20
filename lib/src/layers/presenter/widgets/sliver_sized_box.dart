import 'package:flutter/material.dart';

class SliverSizedBox extends SliverToBoxAdapter {
  SliverSizedBox({Key? key, double? height, double? width})
      : super(
          key: key,
          child: SizedBox(
            height: height,
            width: width,
          ),
        );
}
