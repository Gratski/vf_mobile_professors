import 'package:flutter/material.dart';
import 'package:professors/utils/date_utils.dart';
import 'package:professors/widgets/text/text.builder.dart';

class NotificationDetailsUserDetailsWidget extends StatelessWidget {

  int userId;
  DateTime date;
  String username;
  String pictureUrl;
  String label;

  NotificationDetailsUserDetailsWidget(this.userId, this.username, this.pictureUrl, this.label, {this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(

        children: <Widget>[

          /// Picture
          Flexible(
            flex: 2,
            child: CircleAvatar(
              maxRadius: MediaQuery.of(context).size.width / 10,
              backgroundImage: NetworkImage(pictureUrl),
            ),
          ),

          /// Details
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextsBuilder.h4Bold(username),

                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: TextsBuilder.textSmall(label),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 5),
                    alignment: Alignment.bottomRight,
                    child: ( date != null ) ? TextsBuilder.textSmall('${ DateUtils(context).fromDateToString(date) }', align: TextAlign.end, color: Colors.grey) : Text(''),
                  ),

                ],
              ),
            ),
          ),

        ],

      )
    );
  }

}
