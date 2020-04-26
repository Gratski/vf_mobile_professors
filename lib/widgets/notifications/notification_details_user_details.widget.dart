import 'package:flutter/material.dart';
import 'package:professors/builders/dialog.builder.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/utils/date_utils.dart';
import 'package:professors/widgets/text/text.builder.dart';

class NotificationDetailsUserDetailsWidget extends StatelessWidget {

  int userId;
  DateTime date;
  String username;
  String pictureUrl;
  String body;
  int score;

  NotificationDetailsUserDetailsWidget(this.userId, this.username, this.pictureUrl, this.body, {this.date, this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: <Widget>[

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// Picture
              Flexible(
                flex: 2,
                child: CircleAvatar(
                  maxRadius: MediaQuery.of(context).size.width / 20,
                  backgroundImage: NetworkImage(pictureUrl),
                ),
              ),

              /// Details
              Expanded(
                flex: 6,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextsBuilder.h4Bold(username),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: ( date != null ) ? TextsBuilder.regularText('${ DateUtils(context).fromDateToString(date) }', color: Colors.grey) : Text(''),
                      ),
                    ],
                  ),
                ),
              ),

              /// Actions over comment
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      DialogsBuilder(context).reportCommentDialog();
                    },
                    child: TextsBuilder.textSmall('report')
                  ),
                ),
              ),

            ],

          ),

          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.width / 25),
            child: TextsBuilder.regularText(body),
          ),

          ( score != null ) ?
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  TextsBuilder.textSmall('Classification: '),
                  TextsBuilder.textSmallBold('$score'),
                  Icon(Icons.star, color: AppColors.regularRed,),
                ],
              ),
            ) : Container(
            child: Row(
              children: <Widget>[],
            ),
          ),
        ],

      )
    );
  }

}
