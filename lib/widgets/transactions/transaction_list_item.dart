import 'package:flutter/material.dart';
import 'package:professors/widgets/dividers/dividers_builder.dart';
import 'package:professors/widgets/text/text.builder.dart';

class TransactionListItemWidget extends StatelessWidget {

  final String title;
  final String transactionType;
  final double amount;

  TransactionListItemWidget({this.title, this.transactionType, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// HEADER
          TextsBuilder.h3Bold(title),

          /// SUB TITLE
          Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 8,
                    child: TextsBuilder.regularText(transactionType)
                ),
                Expanded(
                    flex: 4,
                    child: TextsBuilder.regularText('${amount} €', alignment: TextAlign.end)
                ),
              ],
            ),
          ),
          DividersBuilder.dividerWithCenteredText(null)
        ],
      ),
    );
  }
}
