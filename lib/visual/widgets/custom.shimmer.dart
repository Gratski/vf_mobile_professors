import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {

  double height, width;
  CustomShimmer(this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: SizedBox(
        width: this.width,
        height: this.height,
        child: Shimmer.fromColors(
            baseColor: Colors.grey[100],
            highlightColor: Colors.grey[200],
            child: Container(
              color: Colors.white,
            )
        ),
      ),
    );
  }

}
