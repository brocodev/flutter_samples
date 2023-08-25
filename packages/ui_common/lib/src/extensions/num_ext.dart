// ignore_for_file:public_member_api_docs
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumEdgeInsetsExt on num {
  EdgeInsets get edgeInsetsT => EdgeInsets.only(top: h);

  EdgeInsets get edgeInsetsB => EdgeInsets.only(bottom: h);

  EdgeInsets get edgeInsetsL => EdgeInsets.only(left: w);

  EdgeInsets get edgeInsetsR => EdgeInsets.only(right: w);

  EdgeInsets get edgeInsetsV => EdgeInsets.symmetric(vertical: h);

  EdgeInsets get edgeInsetsH => EdgeInsets.symmetric(horizontal: w);

  EdgeInsets get edgeInsetsA => EdgeInsets.all(r);
}

extension NumListEdgeInsetsExt on List<num> {
  EdgeInsets get edgeInsetsTB {
    assert(length == 2, 'The list must be have only 2 elements');
    return EdgeInsets.only(top: this[0].h, bottom: this[1].h);
  }

  EdgeInsets get edgeInsetsLR {
    assert(length == 2, 'The list must be have only 2 elements');
    return EdgeInsets.only(left: this[0].w, right: this[1].w);
  }

  EdgeInsets get edgeInsetsLTRB {
    assert(length == 4, 'The list must be have only 4 elements');
    return EdgeInsets.fromLTRB(this[0].r, this[1].r, this[2].r, this[3].r);
  }
}

extension NumBorderRadiusExt on num {
  BorderRadius get borderRadiusT =>
      BorderRadius.vertical(top: Radius.circular(r));

  BorderRadius get borderRadiusB =>
      BorderRadius.vertical(bottom: Radius.circular(r));

  BorderRadius get borderRadiusL =>
      BorderRadius.horizontal(left: Radius.circular(r));

  BorderRadius get borderRadiusR =>
      BorderRadius.horizontal(right: Radius.circular(r));

  BorderRadius get borderRadiusTL =>
      BorderRadius.only(topLeft: Radius.circular(r));

  BorderRadius get borderRadiusTR =>
      BorderRadius.only(topRight: Radius.circular(r));

  BorderRadius get borderRadiusBL =>
      BorderRadius.only(bottomLeft: Radius.circular(r));

  BorderRadius get borderRadiusBR =>
      BorderRadius.only(bottomRight: Radius.circular(r));

  BorderRadius get borderRadiusA => BorderRadius.all(Radius.circular(r));
}
