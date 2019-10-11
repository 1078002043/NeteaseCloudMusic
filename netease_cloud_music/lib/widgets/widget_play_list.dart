import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/utils/number_utils.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/widgets/widget_play_list_cover.dart';

class PlayListWidget extends StatelessWidget {
  final String picUrl;
  final String text;
  final String subText;
  final num playCount;
  final int maxLines;
  final VoidCallback onTap;

  PlayListWidget({
    @required this.picUrl,
    @required this.text,
    this.playCount,
    this.subText,
    this.onTap,
    this.maxLines = -1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ScreenUtil().setWidth(200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            PlayListCoverWidget(
              picUrl,
              playCount: playCount,
            ),
            VEmptyView(5),
            Text(
              text,
              style: smallCommonTextStyle,
              maxLines: maxLines != -1 ? maxLines : null,
              overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
            ),
            subText == null ? Container() : VEmptyView(2),
            subText == null
                ? Container()
                : Text(
                    subText,
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                    maxLines: maxLines != -1 ? maxLines : null,
                    overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
                  ),
          ],
        ),
      ),
    );
  }
}
