import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loan_app/shared/widgets/shared_widgets.dart';
import '../model/notification_model.dart';

class NotificationsItem extends StatelessWidget {
  NotificationModel notificationModel;
  NotificationsItem(this.notificationModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 337.w,
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(notificationModel.image!),
            title: Text(notificationModel.name!,style: context.theme.textTheme.bodyText1,),
            subtitle: Text(
              notificationModel.description!,style: context.theme.textTheme.headline2?.copyWith(
              color: HexColor( '#7E7B7B'),),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(notificationModel.time!),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 150.w, child: DefaultCard(text:'accept'.tr, width: 150.w,)),
              Container(width: 150.w, child: DefaultCard(text:'reject'.tr, width: 150.w)),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
